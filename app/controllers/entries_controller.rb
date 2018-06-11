class EntriesController < ApplicationController

  get '/entries/new' do
    if logged_in?
      @entry = Entry.new
      erb :'/entries/new'
    else
      redirect '/login'
    end
  end

  post '/entries' do
    @entry = Entry.new(params)
    if !fields_are_populated
      session[:message] = "You're a complex being. Please fill in all the fields."
      session_message
      erb :'/entries/new'
    elsif !params[:rating_emotional].to_i.between?(1,10) || 
          !params[:rating_intellectual].to_i.between?(1,10) ||
          !params[:rating_physical].to_i.between?(1,10)
      session[:message] = "Please fill in a number 1-10 for each of the rating fields."
      session_message
      erb :'/entries/new'
    else
      current_user.entries.build(params).save 
      redirect '/entries'
    end
  end

  get '/entries' do
    if logged_in?
      @entries = current_user.entries
      session_message
      erb :'/entries/entries'
    else
      redirect '/login'
    end
  end

  delete '/entries/:id/delete' do
    if logged_in?
      @entry = Entry.find_by(:id => params[:id])
      if current_user == @entry.user
        @entry.delete
      end
      redirect '/entries'
    else
      redirect '/login'
    end
  end

  get '/entries/:id/edit' do
    if logged_in?
      @entry = Entry.find_by(:id => params[:id])
      if @entry.user == current_user
        session_message
        erb :'entries/edit'
      else
        redirect '/login'
      end
    else
      redirect '/login'
    end
  end

  patch '/entries/:id/edit' do
    if logged_in?
      if !fields_are_populated
        session[:message] = "Please fill in all the fields."
        redirect "/entries/#{params[:id]}/edit"
      else
        @entry = Entry.find_by(:id => params[:id])
      end
      if @entry.user == current_user
        @entry.update(:content_physical => params[:content_physical], :rating_physical => params[:rating_physical], :content_emotional => params[:content_emotional], :rating_emotional => params[:rating_emotional], :content_intellectual => params[:content_intellectual], :rating_intellectual => params[:rating_intellectual])
        redirect '/entries'
      else
        redirect '/login'
      end
    else
      redirect '/login'
    end
  end


end
