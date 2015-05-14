json.array!(@spends) do |spend|
  json.extract! spend, :id, :name, :info
  json.url spend_url(spend, format: :json)
end
