# Overview First Phases because many students don't understand what they are doing, just passing specs
# Parse Key
* Problem: we receive nested keys like: 
  "user[address][zip_code]=94703&user[address][street]=Blake"; from this,
  we want a hash `{ user: { address: { zip_code: 94703, street: "Blake" } } }`
* Step one: split into components; use regex in assignment
* Solutions:
  1. recursively parse each key, then deep merge the resulting hashes
  2. Iteratively build up nested hash

## Code

Recursive
```
def parse_key(components)
  if components.length == 2
    return { components[0] => components[1] }
  end

  { components[0] => parse_key(components[1..-1]) }
end

def deep_merge(hash1, hash2) 
  result = {}
  hash1.each do |key, val|
    if hash2[key].is_a?(Hash) && val.is_a?(Hash)
      result[key] = deep_merge(val, hash2[key])
    else
      result[key] = val
    end
  end
  hash2.each do |key, val|
    unless result[key]
      result[key] = val
    end
  end
end
```
* Workable, but not very nice; let's try the iterative solution

Iterative
```
def build_nested(components)
  result = {}
  components.each do |keys, value|
    current = result
    keys.each_with_index do |el, idx|
      current[el] ||= {}
      if idx == keys.length - 1
        current[el] = keys[idx + 1]
        break
      else
        current = current[el]
      end
    end
  end
  result
end
```
```
def parse_www_encoded_form(www_encoded_form)
  params = {}

  key_values = URI.decode_www_form(www_encoded_form)
  key_values.each do |full_key, value|
    scope = params

    key_seq = parse_key(full_key)
    key_seq.each_with_index do |key, idx|
      if (idx + 1) == key_seq.count
        scope[key] = value
      else
        scope[key] ||= {}
        scope = scope[key]
      end
    end
  end
  params
end
```
