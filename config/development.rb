puts "*******************"
puts "* DEVELOPMENT ENV *"
puts "*******************"

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite:///#{Dir.pwd}/db/ekouf-dev.sqlite")
Slim::Engine.set_default_options pretty: true, sort_attrs: false