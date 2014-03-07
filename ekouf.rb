class Ekouf < Sinatra::Base
  enable :sessions
  require 'mail'
  require_relative 'models/email'

  get '/' do
    slim :index
  end

  get '/product/order' do
    slim :"product/order"
  end

  get '/product/info' do
    slim :"product/info"
  end

  get '/product/statistics' do
    slim :"product/statistics"
  end

  get '/about' do
    slim :"about/omoss"
  end

  get '/organisation' do
    slim :"about/info"
  end

  get '/tips' do
    slim :tips
  end

  get '/env' do
    slim :miljo
  end

  get '/contact' do
    slim :contact
  end

  post '/neworder' do
    content = []
    content << params[:name]
    content << params[:address]
    content << params[:post]
    content << params[:phone]
    content << params[:amount]

    Email.order(content)
    Order.new(name: params[:name], address: params[:address], post: params[:post], phone: params[:phone], amount: params[:amount] )
    redirect '/product/order'
  end

  post '/newvalue' do
    @value = params[:value]
    redirect '/product/statistics'
  end

  get '/company/login' do
    slim :'/company/login'
  end

  post '/login' do
    user = User.first(username: params['username'])
    if user && user.password == params['password']
      session[:user] = user.id
      redirect "/company/inlog/#{user.id}"
    else
      redirect '/company/login'
    end
  end

  get '/company/inlog/:id' do |id|
    if session[:user] == id.to_i
      @user = User.get(session[:user])
      slim :"/company/startpage"
    else
      redirect "/company/login"
    end
  end

  post '/logout' do
    session.destroy
    redirect '/'
  end
end