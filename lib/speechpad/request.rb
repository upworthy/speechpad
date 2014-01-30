require 'base64'
require 'openssl'
require 'cgi'

module Speechpad
  module Request

    def get(params, options={})
      params = generate_signature(params)
      request(:get, params, options)
    end

    def post(params, options={})
      params = generate_signature(params)
      request(:post, params, options)
    end

    private

    # POST the Params to the Speechpad end point.
    #
    # @param body [String] The formatted XML of the API call make sure to call builder.to_xml.
    def request(method, params, options)
      response = connection.send(method) do |request|
        request.url '/services', params
      end
      response.body
    end

    def generate_signature(params)
      params["timestamp"] = Time.now.utc.strftime('%Y-%m-%dT%H:%M:%SZ')

      s =  params.keys.sort.map{|key| params[key]}.join('')
      params["signature"] =  Base64.encode64(OpenSSL::HMAC.digest('sha1',@secret_key, s))[0,28]

      params
    end

  end
end
