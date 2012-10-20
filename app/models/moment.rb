class Moment < ActiveRecord::Base
  include EmbedlyFetcher
  attr_accessible :content, :tag_list
  acts_as_taggable

  before_create :extract_url
  before_create :fetch_thing
  after_create :reward_happy_moment

  belongs_to :user
  has_one :moments_thing
  #has_one :thing, :through => :moments_thing, :polymorphic => true
  has_one :photo, :through => :moments_thing, :source => :thing, :source_type => "Photo"
  has_one :video, :through => :moments_thing, :source => :thing, :source_type => "Video"
  has_one :text, :through => :moments_thing, :source => :thing, :source_type => "Text"


#private
  def reward_happy_moment
    user.increase_happiness
  end

  def extract_url
    self.url = URI::extract(self.content).first
    self.content = self.content.gsub(self.url||'','').strip
    self.content = nil if self.content.blank?
  end

  def fetch_thing
    return if self.url.blank?
    thing = Photo.find_by_url(self.url) || Video.find_by_url(self.url) || Text.find_by_url(self.url)
    if thing.blank?
      embedly_response = fetch(self.url)
      puts embedly_response
      if embedly_response.type == 'photo'
        thing = Photo.new(:photo_url => embedly_response.url, :thumb_url => embedly_response.thumbnail_url)
      elsif embedly_response.type == 'video'
        thing = Video.new(:embed_code => embedly_response.html, :thumb_url => embedly_response.thumbnail_url)
      else
        thing = Text.new()
      end
      puts thing
      thing.url = self.url
      thing.title = embedly_response.title
      thing.description = embedly_response.description
      provider = Provider.find_or_initialize_by_name(embedly_response.provider_name)
      if provider.new_record?
        provider.url = embedly_response.provider_url
        provider.save
      end
      thing.provider = provider
    end
    self.moments_thing = MomentsThing.new(:thing => thing) if thing.present?
  end

end
