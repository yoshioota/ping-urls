json.array!(@ping_url_results) do |ping_url_result|
  json.extract! ping_url_result, :id, :ping_url_id, :response_body
  json.url ping_url_result_url(ping_url_result, format: :json)
end
