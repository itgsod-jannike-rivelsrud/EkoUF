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

  get '/about/#vision' do
    slim :"about/omoss"
  end

  get '/about' do
    slim :"about/omoss"
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
end