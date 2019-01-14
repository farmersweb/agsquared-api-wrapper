module AgsquaredApiWrapper
  class Client
    module Farm

      def products(options={}, raw=false)
        get("/#{api_version}/farm/#{uid}/farmersWeb/products", options, raw)
      end

      def plantings(options={}, raw=false)
        get("/#{api_version}/farm/#{uid}/farmersWeb/plantings", options, raw)
      end

      def crops(options={}, raw=false)
        get("/#{api_version}/farm/#{uid}/farmersWeb/crops", options, raw)
      end

    end
  end
end