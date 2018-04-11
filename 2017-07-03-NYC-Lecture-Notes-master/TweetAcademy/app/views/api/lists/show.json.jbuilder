json.list do
  json.partial! 'list', list: @list
end

json.users do
  json.array! @list.users, partial: 'api/users/user', as: :user
end
