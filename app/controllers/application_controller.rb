require "./config/environment"
require "./app/models/post"
require "./app/mosels/users"

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end
  
  get "/" do
    @users= User.all
    @all_posts = Post.all
    puts @all_posts
    erb :index   
end
  
  post '/new_post' do
    @post=Post.new({:user_id => params[:user_id], :picture => params[:picture], :caption => params[:caption]})
    @post.save   
    redirect "/"
  end
end