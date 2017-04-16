require 'speechpad/client'
require 'logger'

module Speechpad
  class << self
    # Alias for Speechpad::Client.new
    #
    # @return [Speechpad::Client]
    def new(options={})
      Speechpad::Client.new(options)
    end

    # Delegate to Speechpad::Client.new
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end

end
