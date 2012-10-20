class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body

  has_many :moments

  def increase_happiness(happies=25)
    self.update_attribute('happiness',self.happiness.to_i + happies) if happiness.to_i < 150
    self.update_attribute('last_happiness_reminder_at', nil)
  end

  def decrease_happiness(happies=10)
    self.update_attribute('happiness',[self.happiness.to_i - happies,0].max)
    if happiness < 25 && (last_happiness_reminder_at.nil? || last_happiness_reminder_at < 3.days.ago)
      self.update_attribute('last_happiness_reminder_at', DateTime.now)
      HappyMailer.happiness_reminder(self).deliver
    end
  end
end
