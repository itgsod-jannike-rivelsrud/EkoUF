class Order
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :address, String
  property :post, String
  property :phone, String
  property :amount, Integer
end