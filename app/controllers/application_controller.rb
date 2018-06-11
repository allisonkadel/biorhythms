class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'doodlebug'
  end

  get '/' do
    if logged_in?
      redirect "/dashboard/#{current_user.slug}"
    else
      erb :index
    end
  end

  helpers do

    def current_user
      @current_user = User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end

    def session_message
      @session_message = session[:message]
      session[:message] = ""
    end

    def entry_count
      if current_user.entries.count == 0
        "You have no entries, #{current_user.username}."
      elsif current_user.entries.count == 1
        "You have one entry, #{current_user.username}."
      else
        "Here are your entries, #{current_user.username}!"
      end
    end

  end

  def fields_are_populated
    valid = true
    params.each do |param|
      valid = false if param[1] == ""
    end
    valid
  end

end
