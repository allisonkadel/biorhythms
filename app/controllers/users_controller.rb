class UsersController < ApplicationController

get '/signup' do
  if logged_in?
    redirect "/dashboard/#{current_user.slug}"
  else
    session_message
    erb :'users/signup'
  end
end

get '/login' do
  if logged_in?
    redirct "/dashboard/#{current_user.slug}"
  else
    session_message
    erb :'users/login'
  end
end

post '/signup' do
  if User.find_by(:username => params[:username])
      session[:message] = "That username is already in use. Please choose a different one."
      redirect '/signup'
  end
  invalid = 0
  params.each do |param|
    invalid = 1 if param[1] == ""
  end
  if invalid == 1
    session[:message] = "Please fill in a username and password!"
    redirect '/signup'
  else
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect "/dashboard/#{@user.slug}"
  end
end

post '/login' do
  @user = User.find_by(:username => params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/dashboard/#{@user.slug}"
  else
    if fields_are_populated == 0
      session[:message] = "Please fill in a username and password!"
      redirect '/login'
    else
      session[:message] = "You're not a user, my friend! Please create an account."
      redirect '/signup'
    end
  end
end

get '/dashboard/:slug' do
  @user = User.find_by_slug(params[:slug])
  erb :'/users/dashboard'
end

post '/logout' do
  if logged_in?
    session.clear
  end
    redirect '/'
end

end
