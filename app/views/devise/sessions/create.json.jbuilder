json.user do |json|
  json.partial! 'api/users/show', user: @user
end