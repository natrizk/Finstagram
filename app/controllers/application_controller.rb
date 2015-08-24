require "./config/environment"
require "./app/models/post"
require "./app/mosels/users"
require "pry"

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :session_secret, "finstagram"
  end
  
  get "/" do
    if session[:user_id]
      @logged_in_user = User.find(session[:user_id])
    end
    @posts = Post.all
    @users = User.all
    erb :index   
  end
  
  post '/new_post' do
    @post=Post.new({:user_id => params[:user_id], :picture => params[:picture], :caption => params[:caption]})
    @post.save   
    redirect "/"
  end
  
   get '/login' do
    erb :login
  end

  post '/login' do
    @user = User.find_by(:username => params[:username], :email => params[:email])
    if @user
      session[:user_id] = @user.id
      redirect('/')
    else
      erb :error
    end
  end

  get '/logout' do
    session[:user_id] = nil
    redirect('/login')
  end

  get '/users' do
    if session[:user_id]
      @logged_in_user = User.find(session[:user_id])
    end
    @users = User.all
    erb :users
  end

  post '/users' do
    new_user = User.new(:username => params[:username], :email => params[:email],:profile_pic => params[:profile_pic])
    new_user.save
    session[:user_id] = new_user.id
    redirect ('/users')
  end

  
end