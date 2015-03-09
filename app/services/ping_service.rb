class PingService

  def self.ping_all
    PingUrl.find_each do |ping_url|
      ping(ping_url)
    end
  end

  def self.ping(ping_url, force = false)
    unless force
      return false if HttpUtils.cached?(ping_url.url)
    end

    if ping_url.ping_url_results.size >= configatron.ping_url_history_limit
      ping_url.ping_url_results.order('ping_url_results.id ASC').first.destroy
    end

    ping_url.ping_url_results.create(response_body: HttpUtils.get(ping_url.url, force))

    true
  end

end