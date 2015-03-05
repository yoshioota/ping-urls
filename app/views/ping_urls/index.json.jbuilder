json.array!(@ping_urls) do |ping_url|
  json.extract! ping_url, :id, :url
  json.url ping_url_url(ping_url, format: :json)
end
