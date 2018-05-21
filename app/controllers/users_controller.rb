class UsersController < ApplicationController

get '/signup' do
  erb :'users/signup'
end

get '/login' do
  erb :'users/login'
end

post '/signup' do
  @user = User.create_by(params)
  session[:user_id] = @user.id
  binding.pry
end

end
