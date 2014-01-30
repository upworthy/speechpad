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

  describe ".add_audio_url" do
    it "should be a success when passing a url with a file to transcribe" do
      stub_request(:get, "http://dev.speechpad.com/services?access_key=abc123&format=json&method=post&operation=add_audio_url&service_name=account&service_version=1.0.0&signature=0in1rEuhI%2BHdXZqQg7dAGlV3AEE=&timestamp=2014-01-01T08:00:00Z&transcribe=true&url=https://www.speechpad.com/is_a.mp3&visible_filename=https://www.speechpad.com/is_a.mp3").
         to_return(:status => 200, :body => '{"error_string":"SUCCESS", "response":{"audio_id": 63068}}' , :headers => {'Content-Type' => 'application/json'})

      test = @client.add_audio_url('https://www.speechpad.com/is_a.mp3')
      test.response.audio_id.should eql 63068
    end
  end

  describe ".add_media_url" do
    it "should be a success when passing a url to transcribe" do
      stub_request(:get, "http://dev.speechpad.com/services?access_key=abc123&format=json&method=post&operation=add_media_url&service_name=account&service_version=1.0.0&signature=YOWA%2BAut3xvLaKhBe2sc5vr%2BZ1o=&timestamp=2014-01-01T08:00:00Z&transcribe=true&url=http://www.youtube.com/watch?v=meiU6TxysCg").
        to_return(:status => 200, :body => '{"error_string":"SUCCESS", "response":{"audio_id": 63068}}' , :headers => {'Content-Type' => 'application/json'})

      test = @client.add_media_url('http://www.youtube.com/watch?v=meiU6TxysCg')
      test.response.audio_id.should eql 63068
    end
  end

  describe ".get_transcription" do
    it "should get the transcription of the audo file and return it" do
       stub_request(:get, "http://dev.speechpad.com/services?access_key=abc123&audio_id=1234&format=json&method=get&operation=get_transcription&service_name=account&service_version=1.0.0&signature=KjqOK1mHDkyMVi%2B%2Bj%2BnpwZEdTCw=&timestamp=2014-01-01T08:00:00Z").
         to_return(:status => 200, :body => '{"error_string":"SUCCESS","response":"Hello!"}' , :headers => {'Content-Type' => 'application/json'})
      test = @client.get_transcription(1234)
      test.response.should eql "Hello!"
    end
  end

  describe ".get_machine_transcription" do
    it "should get the machine transcription of the audo file and return it" do
       stub_request(:get, "http://dev.speechpad.com/services?access_key=abc123&audio_id=1234&format=json&method=get&operation=get_machine_transcription&service_name=account&service_version=1.0.0&signature=wBZvG0znUqF1YvvJXEbQzF%2Buq1k=&timestamp=2014-01-01T08:00:00Z").
         to_return(:status => 200, :body => '{"error_string":"SUCCESS","response":"Hello!"}' , :headers => {'Content-Type' => 'application/json'})

      test = @client.get_machine_transcription(1234)
      test.response.should eql "Hello!"
    end
  end

  describe ".machine_transcription_status" do
    it "should get the status of the machine trascript with the given id" do
      stub_request(:get, "http://dev.speechpad.com/services?access_key=abc123&audio_id=1234&format=json&method=get&operation=machine_transcription_status&service_name=account&service_version=1.0.0&signature=k4tkFqwsZYrHpVDl0JYCzs6LtLE=&timestamp=2014-01-01T08:00:00Z").
        to_return(:status => 200, :body => '{"error_string":"SUCCESS","response":{"1234":"done"}}' , :headers => {'Content-Type' => 'application/json'})
      test = @client.machine_transcription_status('1234')
      test.response['1234'].should eql 'done'
    end
  end

  describe ".transcription_status" do
    it "should get the status of the transcription with the given id" do
       stub_request(:get, "http://dev.speechpad.com/services?access_key=abc123&audio_id=1234&format=json&method=get&operation=transcription_status&service_name=account&service_version=1.0.0&signature=YOHVemU8vLwSMsuinuOGifgLfsg=&timestamp=2014-01-01T08:00:00Z").
        to_return(:status => 200, :body => '{"error_string":"SUCCESS","response":{"1234":"done"}}' , :headers => {'Content-Type' => 'application/json'})
      test = @client.transcription_status('1234')
      test.response['1234'].should eql 'done'
    end
  end


end
