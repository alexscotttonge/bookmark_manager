require 'data_mapper'
require 'dm-postgres-adapter'

class Link # this class corresponds to a table in the database

  include DataMapper::Resource # add DataMapper functionality to this class so it can communicate with the database

  has n, :tags, through: Resource

  # these property declarations set the column headers in the 'links' table
  property :id,     Serial # Serial means it will be auto-incremented for every record
  property :title,  String
  property :url,    String

end
