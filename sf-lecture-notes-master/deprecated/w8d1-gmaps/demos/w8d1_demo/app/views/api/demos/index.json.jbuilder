json.demos do
  @demos.each do |demo|
    json.set! demo.id do
      json.extract! demo, :name, :price, :id
    end
  end
end

json.ids @demos.pluck :id
