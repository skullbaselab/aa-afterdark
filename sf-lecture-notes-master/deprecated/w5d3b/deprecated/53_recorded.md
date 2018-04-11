# Week 5 Day 3

#### Nesting Params

```ruby
`user[addr][street] = encanto & user[addr][number] = 4`
# we want to take the above string and return a json object like this
# user => { addr => { street => 'encanto', number => 4}}

#=> use URI::decode_www_form to get
[['user[addr][street]', 'encanto'], ['user[addr][number]', 4]]

#=> then use regex to get key array
kv_pairs = [[['user', 'addr', 'street'], 'encanto'], [['user', 'addr', 'number'], 4]]

result = []
kv_pairs.each do |key_array, val|
  current_node = result
  key_array.each_with_index do |key, idx|
    if idx == key_array.length - 1
      current_node[key] = val
    else
      unless current_node[key].is_a?(Hash)
        current_node[key] = {}
      end
      current_node = current_node[key]
    end
  end
end
```
