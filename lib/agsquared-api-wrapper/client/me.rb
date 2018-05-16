module AgsquaredApiWrapper
  class Client
    module Me
      
      def me(options={}, raw=false)
        get("/#{api_version}/me", options, raw)
      end
      
    end
  end
end