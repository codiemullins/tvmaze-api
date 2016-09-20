require 'faraday'
require 'singleton'

module Tvmaze
  module Api
    class Connection

      include Singleton

      def initialize
        @conn = Faraday.new(url: 'http://api.tvmaze.com') do |faraday|
          faraday.request  :url_encoded
          faraday.response :logger
          faraday.adapter  :net_http_persistent
        end
      end

      def conn
        @conn
      end

    end

  end

end
