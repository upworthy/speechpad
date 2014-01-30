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

    # Add a new audio to the user’s account from a URL, should be a file.
    #
    # @param url [String] A valid URL to the file to be downloaded
    # @param visible_filename [String] The filename to display to user, defaults to url if blank
    # @param transcribe [Boolean] 'false' - set 'true' to initiate transcription
    # @param options [Hash] Optional Params
    # @return [Mash] Mashify body with ERROR_STRING and Response
    # @example Add a url of a file to be transcribed
    #   s = Speechpad::Client.new({access_key: "abc123", secret_key: "xyz456"})
    #   s.add_audio_url('https://www.speechpad.com/is_a.mp3')
    def add_audio_url(url, visible_filename=url,  transcribe=true, options={})
      params = build_params('operation' => 'add_audio_url', 'method' => 'post', 'visible_filename' => visible_filename,
                            'url' => url, 'transcribe' => transcribe)
      get(params, options)
    end

    # Add a new media to the user’s account from a URL, like Youtube.
    #
    # @param url [String] A valid URL to the file to be downloaded
    # @param transcribe [Boolean] 'false' - set 'true' to initiate transcription
    # @param options [Hash] Optional Params
    # @return [Mash] Mashify body with ERROR_STRING and Response
    # @example Add a media url to a file to be transcribed
    #   s = Speechpad::Client.new({access_key: "abc123", secret_key: "xyz456"})
    #   s.add_media_url('http://www.youtube.com/watch?v=meiU6TxysCg')
    def add_media_url(url, transcribe=true, options={})
      params = build_params('operation' => 'add_media_url', 'method' => 'post', 'url' => url, 'transcribe' => transcribe)
      get(params, options)
    end

    # Return the transcription status of one or more audio files.
    #
    # @param audio_id [String] The ID of the audio file
    # @param options [Hash] Optional Params
    # @return [Mash] Mashify body with ERROR_STRING and Response
    # @example Get the transcription of the audio file
    #   s = Speechpad::Client.new({access_key: "abc123", secret_key: "xyz456"})
    #   s.get_transcription(1234)
    def get_transcription(audio_id, options={})
      params = build_params('operation' => 'get_transcription', 'method' => 'get', 'audio_id' => audio_id)
      get(params, options)
    end

    # Return the machine transcription status of one or more audio files.
    #
    # @param audio_id [String] The ID of the audio file
    # @param options [Hash] Optional Params
    # @return [Mash] Mashify body with ERROR_STRING and Response
    # @example Get the machine transcription of the audio file
    #   s = Speechpad::Client.new({access_key: "abc123", secret_key: "xyz456"})
    #   s.get_machine_transcription(1234)
    def get_machine_transcription(audio_id, options={})
      params = build_params('operation' => 'get_machine_transcription', 'method' => 'get', 'audio_id' => audio_id)
      get(params, options)
    end


    # Return the machine transcription status of one or more audio files.
    #
    # @param audio_id [String] The ID of the audio file
    # @param options [Hash] Optional Params
    # @return [Mash] Mashify body with ERROR_STRING and Response
    # @example Get the machine transcription status of the audio file
    #   s = Speechpad::Client.new({access_key: "abc123", secret_key: "xyz456"})
    #   s.get_machine_transcription_status(1234)
    def machine_transcription_status(audio_id, options={})
      params = build_params('operation' => 'machine_transcription_status', 'method' => 'get', 'audio_id' => audio_id)
      get(params, options)
    end

    # Return the transcription status of one or more audio files.
    #
    # @param audio_id [String] The ID of the audio file
    # @param options [Hash] Optional Params
    # @return [Mash] Mashify body with ERROR_STRING and Response
    # @example Get the transcription status of the audio file
    #   s = Speechpad::Client.new({access_key: "abc123", secret_key: "xyz456"})
    #   s.get_transcription_status(1234)
    def transcription_status(audio_id, options={})
      params = build_params('operation' => 'transcription_status', 'method' => 'get', 'audio_id' => audio_id)
      get(params, options)
    end

    # A test call for the Speechpad API (only works on dev).
    #
    # @param options [Hash] Optional Params
    # @return [Mash] Mashify body with ERROR_STRING and Response
    # @example Get the transcription status of the audio file
    #   s = Speechpad::Client.new({access_key: "abc123", secret_key: "xyz456"})
    #   s.test
    def test(options={})
      params = build_params('operation' => 'test', 'value' => '123', 'method' => 'get')
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
