module AgsquaredApiWrapper
  class Client
    module Refresh
      def refresh!(options={}, raw=false)
        options.merge!({
          :grant_type => 'refresh_token', 
          :client_id => consumer_token, 
          :client_secret => consumer_secret, 
          :refresh_token => refresh_token,
          :scope => 'farmersWeb'
        })

        ap options

        post("/#{api_version}/oauth2/token", options, raw)
      end
    end
  end
end
