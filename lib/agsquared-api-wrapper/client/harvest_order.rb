module AgsquaredApiWrapper
  class Client
    module HarvestOrder
      # https://api.agsquared.com/v1/business_unit/9157/harvest_orders
      # id - The database id
      # mobile_id - A UUIDv4 identifier, this will be used in v2 of the API as the id #
      # amount - The amount of product being ordered
      # ref_num - A reference number that the user can enter
      # product_id - The product/unit that is being ordered
      # subscription_id - I don’t think you actually need to submit this, but it’s the subscription that the record belongs to
      # sales_notes - Notes that the user can enter as a reference to themselves
      # harvest_notes - Notes that the user can enter to display to the harvesting team
      # date - The date that the harvest order is expected to be harvested on

      def harvest_orders(options={}, raw=false)
        get("/#{api_version}/business_unit/#{uid}/harvest_orders", options, raw)
      end

      def harvest_order(id, options={}, raw=false)
        get("/#{api_version}/business_unit/#{uid}/harvest_orders/#{id}", options, raw)
      end

      def add_harvest_order(options={}, raw=false)
        options.merge!(
          {
            subscription_id: uid
          })

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