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
    @tips = Tips.all
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
    Order.create(name: params[:name], address: params[:address], post: params[:post], phone: params[:phone], amount: params[:amount])
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
      redirect "/company/inlog"
    else
      redirect '/company/login'
    end
  end

  get '/company/inlog' do
    if session[:user]
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

  get '/company/orders' do
    if session[:user]
      @user = User.get(session[:user])
      @orders = Order.all
      slim :"/company/orders"
    else
      redirect "/company/login"
    end
  end

  get '/company/tips' do
    if session[:user]
      @user = User.get(session[:user])
      slim :"/company/tips"
    else
      redirect '/tips'
    end
  end

  post '/newtips' do
    Tips.create(text: params[:content], image: params[:image])
    redirect 'company/tips'
  end

  post '/deleteorder' do
    order = Order.get(params[:id])
    order.inspect
    order.destroy
    redirect '/company/orders'
  end
end