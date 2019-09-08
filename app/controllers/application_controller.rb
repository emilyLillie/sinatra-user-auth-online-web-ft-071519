class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :home
  end

  get '/registrations/signup' do

    erb :'/registrations/signup'
  end

# handles post request sent when user submits on the signup form, it contains code that gets the new user's info from the params hash, creates a new user, signs them in, then directs them to users/home 
  post '/registrations' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:user_id] = @user.id

    redirect '/users/home'
  end

  get '/sessions/login' do

    # the line of code below renders the view page in app/views/sessions/login.erb
    erb :'sessions/login'
  end

# post sessions receives the post request that gets sent when the user sumbits, contains code to grab the user's info from the params hash and looks to match the info against existing entries. if there's a match, signs the user in 
  post '/sessions' do
    puts params 
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/users/home'
    end
    redirect '/sessions/login'
  end

  get '/sessions/logout' do
    session.clear
    redirect '/'
  end


# renders user's homepage view 
  get '/users/home' do
    @user = User.find(session[:user_id])
    erb :'/users/home'
  end
end
