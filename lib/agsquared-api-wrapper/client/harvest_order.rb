module AgsquaredApiWrapper
  class Client
    module HarvestOrder

      # https://api.agsquared.com/v1/business_unit/9157/harvest_orders
      def harvest_orders(options={}, raw=false)
        get("/#{api_version}/business_unit/#{uid}/harvest_orders", options, raw)
      end

      def harvest_order(id, options={}, raw=false)
        get("/#{api_version}/business_unit/#{uid}/harvest_orders/#{id}", options, raw)
      end

      def add_harvest_order(options={}, raw=false)
        post("/#{api_version}/business_unit/#{uid}/harvest_orders", options, raw)
      end

      def update_harvest_order(id, options={}, raw=false)
        put("/#{api_version}/business_unit/#{uid}/harvest_orders/#{id}", options, raw)
      end

      def delete_harvest_order(id, options={}, raw=false)
        delete("/#{api_version}/business_unit/#{uid}/harvest_orders/#{id}", options, raw)
      end

    end
  end
end