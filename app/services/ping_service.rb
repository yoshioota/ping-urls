class PingService

  def self.ping_all
    PingUrls.find_each do |ping_url|
      HttpUtils.get(ping_url)
    end
  end
end