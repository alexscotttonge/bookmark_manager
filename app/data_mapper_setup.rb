require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/tag'
require_relative 'models/link'


# display logs
DataMapper::Logger.new($stdout, :debug)
# set up a connection with a database
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
# check everything written in the models is OK
DataMapper.finalize
# build any new columns or tables added. Also doesn't overwrite any existing data.
DataMapper.auto_upgrade!
