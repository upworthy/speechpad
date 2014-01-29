require 'faraday'
require 'faraday_middleware'

module Speechpad
  # @private
  module Connection
    private

    def connection(options={})
      connection = Faraday.new @speechpad_url do |conn|
        # Uncomment if want to log to stdout
        #conn.response :logger

        conn.request :url_encoded
        conn.response :mashify

        conn.adapter Faraday.default_adapter
      end
      connection
    end
  end
end
