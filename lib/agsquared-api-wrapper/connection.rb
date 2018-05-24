require 'faraday_middleware'
require 'faraday/response/raise_agsquared_api_error'

module AgsquaredApiWrapper
  module Connection
    private
    def oauth_data
      {
        consumer_key: @consumer_token,
        consumer_secret: @consumer_secret,
        token: @access_token, 
        refresh_token: @refresh_token
      }
    end
    
    def connection(raw=false, force_urlencoded=false)
      url = "#{AgsquaredApiWrapper.api_endpoint}"

      options = {
        url: url,
        proxy: proxy,
        ssl: { verify: false },
      }
      
      connection = Faraday.new(options) do |builder|
        builder.use Faraday::Response::RaiseAgsquaredApiError
        builder.request :json
        builder.request :oauth, oauth_data
        builder.authorization :Bearer, oauth_data[:token]
        unless raw
          builder.use FaradayMiddleware::Mashify
          builder.use FaradayMiddleware::ParseJson
        end
        builder.adapter *adapter
      end
      connection
    end
  end
end