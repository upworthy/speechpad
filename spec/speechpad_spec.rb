require 'helper'

describe Speechpad do

  before do
    @client =  Speechpad::Client.new({access_key: 'abc123', secret_key: 'xyz456', url: 'http://dev.speechpad.com'})
  end

  describe ".new" do
    it "should be a new Speechpad::Client" do
      Speechpad.new.should be_a Speechpad::Client
    end
  end

  describe ".respond_to?" do
    it "should be true if method exists" do
      Speechpad.respond_to?(:new, true).should be_true
    end
  end

  describe ".test" do
    it "should make a test call to the Speechpad API" do

      stub_request(:get, "http://dev.speechpad.com/services?access_key=abc123&format=json&method=get&operation=test&service_name=account&service_version=1.0.0&signature=MP6ZzbYANYB7vuJnUIg40Z2yPz4=&timestamp=2014-01-01T08:00:00Z&value=123").
         to_return(:status => 200, :body => '{"error_string":"SUCCESS","response":{"value":"123"}}', :headers => {'Content-Type' => 'application/json'})

      @client.test.response.value.should eql "123"
    end
  end
end
