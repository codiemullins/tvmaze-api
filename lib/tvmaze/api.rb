require "tvmaze/api/connection"
require "tvmaze/api/version"

module Tvmaze
  module Api
    CONNECTION = Tvmaze::Api::Connection.instance.conn
  end
end
