require 'agsquared-api-wrapper/version'
require 'agsquared-api-wrapper/configuration'
require 'agsquared-api-wrapper/client'
require 'agsquared-api-wrapper/error'

module AgsquaredApiWrapper
  extend Configuration
  class << self
    # Alias for AgsquaredApiWrapper::Client.new
    #
    # @return [AgsquaredApiWrapper::Client]
    def new(options={})
      AgsquaredApiWrapper::Client.new(options)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
