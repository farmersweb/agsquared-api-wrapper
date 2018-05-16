require 'agsquared-api-wrapper/configuration'
require 'agsquared-api-wrapper/connection'
require 'agsquared-api-wrapper/request'
require 'agsquared-api-wrapper/error'
require 'agsquared-api-wrapper/client/me'

module AgsquaredApiWrapper
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options={})
      options = AgsquaredApiWrapper.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
    
    include AgsquaredApiWrapper::Configuration
    include AgsquaredApiWrapper::Connection
    include AgsquaredApiWrapper::Request
    include AgsquaredApiWrapper::Client::Me
  end
end
