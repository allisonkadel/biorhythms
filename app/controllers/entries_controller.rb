class EntriesController < ApplicationController

get '/entries/new' do
  erb :'/entries/new'
end

post '/entries/new' do
  binding.pry
end

end
