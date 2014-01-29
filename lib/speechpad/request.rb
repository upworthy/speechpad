module Speechpad
  module Request

    def get(params, options={})
      request(:get, params, options)
    end

    def post(params, options={})
      request(:post, params, options)
    end

    private

    # POST the Params to the Speechpad end point.
    #
    # @param body [String] The formatted XML of the API call make sure to call builder.to_xml.
    def request(method, params, options)
      response = connection.send(method) do |request|
        request
        request.body = body
      end
      response.body
    end
  end
end
