json.array!(@benmarks) do |benmark|
  json.extract! benmark, :id, :url, :user_id
  json.url benmark_url(benmark, format: :json)
end
