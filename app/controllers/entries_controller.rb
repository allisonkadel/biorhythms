class EntriesController < ApplicationController

  get '/entries/new' do
    if logged_in?
      erb :'/entries/new'
    else
      redirect '/login'
    end
  end

  post '/entries' do
    invalid = 0
    params.each do |param|
      invalid = 1 if param[1] == ""
    end
    if invalid == 1
      redirect '/entries/new'
    else
      current_user.entries.build(params).save
      redirect '/entries'
    end
  end

  get '/entries' do
    if logged_in?
      @entries = current_user.entries
      erb :'/entries/entries'
    else
      redirect '/login'
    end
  end

  delete '/entries/:id/delete' do
    @entry = Entry.find_by(:id => params[:id])
    if current_user == @entry.user
      @entry.delete
    end
    redirect '/entries'
  end

  get '/entries/:id/edit' do
    @entry = Entry.find_by(:id => params[:id])
    if @entry.user == current_user
      erb :'entries/edit'
    else
      redirect '/login'
    end
  end

  patch '/entries/:id/edit' do
    @entry = Entry.find_by(:id => params[:id])
    if @entry.user == current_user
      @entry.update(:content_physical => params[:content_physical], :rating_physical => params[:rating_physical], :content_emotional => params[:content_emotional], :rating_emotional => params[:rating_emotional], :content_intellectual => params[:content_intellectual], :rating_intellectual => params[:rating_intellectual])
      redirect '/entries'
    else
      redirect '/login'
    end
  end


end
