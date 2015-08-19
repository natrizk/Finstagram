require "./config/environment"
require "./app/models/post"

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end
  
  get "/" do
    @all_posts = Post.all
    puts @all_posts
    erb :index   
end
  
  post '/new_post' do
    Post.create({:username => params[:username], :picture => params[:picture], :caption => params[:caption]})
    redirect to '/'
  end
end