require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require './models/bbs.rb'
require './image_uploader.rb'

enable :sessions

before do
    @categories = Category.all
end

get '/' do
    session[:test]
    @contents = Contribution.order('id desc').all
    @categories = Category.all
    erb :index
end

post '/new' do
    Contribution.create({
        title: params[:title],
        body: params[:body],
        img: "",
        category_id: params[:category],
        good: 0
    })
    
    if params[:file]
        image_upload(params[:file])
    end
    
    redirect '/'
end

post '/delete/:id' do
    Contribution.find(params[:id]).destroy
    redirect '/'
end

post '/edit/:id' do
    @content = Contribution.find(params[:id])
    erb :edit
end

post '/renew/:id' do
    @content = Contribution.find(params[:id])
    @content.update({
        title: params[:title],
        body: params[:body],
        img: "",
        category_id: params[:category]
        })
        
    if params[:file]
        image_upload(params[:file], params[:id])
    end    
        
    redirect '/'
end

get '/category/:id' do
    @categories = Category.all
    @category = Category.find(params[:id])
    @category_name = @category.name
    @contents = @category.contributions
    erb :index
end

post '/good/:id' do
    @content = Contribution.find(params[:id])
    iine = @content.iine
    @content.update({
        iine: iine + 1
    })
    redirect '/'
end

get '/login.erb' do
    erb :login
end

get '/signin' do
    erb :sign_in
end

get '/signup' do
    erb :sign_up
end

post '/signup' do
    @user = User.create(mail:params[:mail], password:params[:password],
    password_confirmation:params[:password_confirmation])
    
    if @user.persisted?
        session[:user] = @user.id
    end
    redirect '/'
end

post '/signin' do
    user = User.find_by(mail: params[:mail])
    if user && user.authenticate(params[:password])
        session[:user] = user.id
    end
    redirect '/'
end

get '/signout' do
    session[:user] = nil
    redirect '/'
end

    
    
    
    
    
    
    
    