class EntriesController < ApplicationController

get '/entries/new' do
  erb :'/entries/new'
end

post '/entries' do
  current_user.entries.build(params).save
  binding.pry
end

end
