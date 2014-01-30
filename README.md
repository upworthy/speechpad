# Speechpad
A Ruby wrapper for the Speechpad API

[![Build Status](https://secure.travis-ci.org/upworthy/speechpad.png?branch=master)][travis]
[travis]: http://travis-ci.org/upworthy/speechpad

## Installation

    $ gem install speechpad

## Documentation


## Usage Examples
    require 'spechpad'

    @client = Speechpad::Client.new({access_key: "abc123", secret_key: "xyz456"})

    #add_audio_url
    a = @client.add_audio_url('https://www.speechpad.com/is_a.mp3')
    a.response.audio_id # => 63068

## Copyright
Copyright (c) 2013 Upworthy. See [LICENSE][] for details.

[license]: https://github.com/upworthy/speechpad/blob/master/LICENSE.md

