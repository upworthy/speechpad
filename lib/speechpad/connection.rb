require 'faraday'
require 'faraday_middleware'

module Speechpad
  # @private
  module Connection
    private

    def connection(options={})
      connection = Faraday.new @speechpad_url do |conn|
        unless ENV['SPEECHPAD_VERBOSE']
          conn.response :logger, ::Logger.new("/dev/null")
        end

        conn.request :url_encoded
        conn.response :mashify
        conn.response :json, :content_type => /\bjson$/

        conn.adapter Faraday.default_adapter
      end
      connection
    end
  end
end
