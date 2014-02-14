class Tips
  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  property :image, String

end