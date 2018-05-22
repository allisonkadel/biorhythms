class EntriesController < ApplicationController

  get '/entries/new' do
    erb :'/entries/new'
  end

  post '/entries' do
    current_user.entries.build(params).save
    redirect '/entries'
  end

  get '/entries' do
    @entries = current_user.entries
    erb :'/entries/entries'
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
      @entry.update(params)
      redirect '/entries'
    else
      redirect '/login'
    end
  end


end
