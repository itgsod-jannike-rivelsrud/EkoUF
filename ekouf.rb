class Ekouf < Sinatra::Base
  enable :sessions

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
  #
  #get '/about/organisation' do
  #  slim :"about/info"
  #end
  #
  #get '/about/#bussinesplan' do
  #  slim :"about/omoss"
  #end

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
end