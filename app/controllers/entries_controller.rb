class EntriesController < ApplicationController

<<<<<<< HEAD
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
=======
get '/entries/new' do
  erb :'/entries/new'
end

post '/entries' do
  current_user.entries.build(params).save
  binding.pry
end
>>>>>>> 169dd1a5a7c3d0365f3f0b20e6c47e5dd2f59b46

end
