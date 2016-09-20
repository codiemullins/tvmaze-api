require "json"

module Tvmaze
  module Api
    class Show
      def initialize
      end

      def self.find id
        response = Tvmaze::Api::CONNECTION.get("/shows/#{id}")
        attributes = JSON.parse(response.body)
      end
    end

  end

end
