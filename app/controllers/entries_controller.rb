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

  get '/entries/:id/delete' do
    "deleting entry"
  end

  get '/entries/:id/edit' do
    "editing entry"
  end

end
