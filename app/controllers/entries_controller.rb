class EntriesController < ApplicationController

get '/entries/new' do
  erb :'/entries/new'
end

post '/entries/new' do
  current_user.entries.build(params).save
end

end
