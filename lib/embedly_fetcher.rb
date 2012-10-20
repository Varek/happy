module EmbedlyFetcher

  def fetch(fetch_url)
    embedly_key = EmbedlyConfig['embedly_api_key']
    embedly_api = Embedly::API.new(:user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)', :key => embedly_key)
    embedly_objects = embedly_api.oembed(:url => fetch_url)
    embedly_objects[0]
  end
end