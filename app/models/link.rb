
require 'data_mapper'
require 'dm-postgres-adapter'

class Link # this class corresponds to a table in the database

  include DataMapper::Resource # add DataMapper functionality to this class so it can communicate with the database

  # these property declarations set the column headers in the 'links' table
  property :id,     Serial # Serial means it will be auto-incremented for every record
  property :title,  String
  property :url,    String

end

# display logs
DataMapper::Logger.new($stdout, :debug)
# set up a connection with a database
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
# check everything written in the models is OK
DataMapper.finalize
# build any new columns or tables added. Also doesn't overwrite any existing data.
DataMapper.auto_upgrade!
