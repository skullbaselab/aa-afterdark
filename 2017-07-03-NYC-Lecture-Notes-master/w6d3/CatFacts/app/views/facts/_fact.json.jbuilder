# extract just means get each of those attributes
json.extract! fact, :id, :body, :created_at, :updated_at
# add an attribute called url
json.url fact_url(fact, format: :json)
