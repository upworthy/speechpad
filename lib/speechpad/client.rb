require 'speechpad/connection'
require 'speechpad/request'

module Speechpad
  class Client
    def initialize(options={})
      @access_key = options[:access_key]
      @secret_key = options[:secret_key]
      @speechpad_url = options[:url]
    end

    include Speechpad::Connection
    include Speechpad::Request

  end
end
