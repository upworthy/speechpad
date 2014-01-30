require 'speechpad/connection'
require 'speechpad/request'

module Speechpad
  class Client
    def initialize(options={})
      @access_key = options[:access_key]
      @secret_key = options[:secret_key]
      @speechpad_url =  options[:url] || 'http://www.speechpad.com/'
    end

    include Speechpad::Connection
    include Speechpad::Request

    def test(options={})
      params=build_params('operation' => 'test', 'value' => '123', 'method' => 'get')
      get(params, options)
    end

    private

    def build_params(params)
      params['service_name'] = 'account'
      params['service_version'] = '1.0.0'
      params['access_key'] = @access_key
      params['format'] = 'json'
      params
    end

  end
end
