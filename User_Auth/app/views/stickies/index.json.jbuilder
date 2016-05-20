json.array!(@stickies) do |sticky|
  json.extract! sticky, :id, :title, :users, :content
  json.url sticky_url(sticky, format: :json)
end
