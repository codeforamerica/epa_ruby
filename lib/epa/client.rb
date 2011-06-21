require 'epa/client'
require 'epa/client/connection'
require 'epa/client/request'


module EPA
  class Client
    include EPA::Client::Connection
    include EPA::Client::Request

  end
end
