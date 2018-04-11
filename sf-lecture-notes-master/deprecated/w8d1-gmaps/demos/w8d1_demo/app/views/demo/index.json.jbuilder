@demos.each do |demo|
  json.set! demo.id do
    json.extract! demo, :name, :price, :id
  end
end

json.array! @demos, :id
