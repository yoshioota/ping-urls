require 'open-uri'

class HttpUtils

  def self.cached?(url)
    !!Rails.cache.read("html_caches.#{Digest::MD5.hexdigest(url)}")
  end

  def self.get(_url)
    url = _url.strip
    Rails.cache.fetch("html_caches.#{Digest::MD5.hexdigest(url)}", expires_in: 9.minutes) do
      ret = open(url).read
      sleep(1)
      ret
    end
  end

end
