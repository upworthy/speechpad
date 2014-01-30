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

    def add_audio_url(url, visible_filename=url,  transcribe=true, options={})
      params = build_params('operation' => 'add_audio_url', 'method' => 'post', 'visible_filename' => visible_filename,
                            'url' => url, 'transcribe' => transcribe)
      get(params, options)
    end

    def add_media_url(url, transcribe=true, options={})
      params = build_params('operation' => 'add_media_url', 'method' => 'post', 'url' => url, 'transcribe' => transcribe)
      get(params, options)
    end

    def get_transcription(audio_id, options={})
      params = build_params('operation' => 'get_transcription', 'method' => 'get', 'audio_id' => audio_id)
      get(params, options)
    end

    def get_machine_transcription(audio_id, options={})
      params = build_params('operation' => 'get_machine_transcription', 'method' => 'get', 'audio_id' => audio_id)
      get(params, options)
    end

    def machine_transcription_status(audio_id, options={})
      params = build_params('operation' => 'machine_transcription_status', 'method' => 'get', 'audio_id' => audio_id)
      get(params, options)
    end

    def transcription_status(audio_id, options={})
      params = build_params('operation' => 'transcription_status', 'method' => 'get', 'audio_id' => audio_id)
      get(params, options)
    end

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
