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
  redirect "/dashboard/#{@user.slug}"
end

post '/login' do
  @user = User.find_by(:username => params[:username])
  session[:user_id] = @user.id
  redirect "/dashboard/#{@user.slug}"
end

get '/dashboard/:slug' do
  @user = User.find_by_slug(params[:slug])
  erb :'/users/dashboard'
end

get '/logout' do
  session.clear
  redirect '/'
end

end
