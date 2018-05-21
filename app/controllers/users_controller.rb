class UsersController < ApplicationController

get '/signup' do
  erb :'users/signup'
end

get '/login' do
  erb :'users/login'
end

post '/signup' do
  @user = User.create(params)
  session[:user_id] = @user.id
  redirect '/entries'
end

post '/login' do
  @user = User.find_by(:username => params[:username])
  session[:user_id] = @user.id
  redirect '/entries'
end

end
