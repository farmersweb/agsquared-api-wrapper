module AgsquaredApiWrapper
  class Client
    module Farm

      def products(farm_id, options={}, raw=false)
        get("/#{api_version}/farm/#{farm_id}/farmersWeb/products", options, raw)
      end

      def plantings(farm_id, options={}, raw=false)
        get("/#{api_version}/farm/#{farm_id}/farmersWeb/plantings", options, raw)
      end
      
    end
  end
end