require 'spec_helper'

describe AgsquaredApiWrapper::Client::HarvestOrder do
  let(:client) do
    agsquared_client
  end
  
  after(:each) do
    agsquared_client.reset
  end

  it "should allow for adding a harvest order" do
    VCR.use_cassette :harvest_orders, 
      :record => :new_episodes, 
      :match_requests_on => [:path, :method] do

      options = {
        :amount => 1.0,
        :harvest_notes => "Grains - 2-Row Barley - Rasmusson - 1.0 bag of 5  pounds",
        :ref_num => 44070,
        :date => "Mon, 28 Jan 2019 05:00:00 UTC +00:00",
        :product_id => 157704,
        :subscription_id => 11512
      }

      response = client.add_harvest_order(options)

      expect(response).to be_an_instance_of(Hashie::Mash)
      expect(response.harvest_orders.id).to eq "256"
    end
  end

  it "should allow for updating a harvest order" do
    VCR.use_cassette :harvest_orders, 
      :record => :new_episodes, 
      :match_requests_on => [:path, :method] do

      options = {
        :amount => 5.0,
        :harvest_notes => "Grains - 2-Row Barley - Rasmusson - 1.0 bag of 5  pounds",
        :ref_num => 44070,
        :date => "Mon, 28 Jan 2019 05:00:00 UTC +00:00",
        :product_id => 157704,
        :subscription_id => 11512
      }

      response = client.update_harvest_order(253, options)

      expect(response).to be_an_instance_of(Hashie::Mash)
      expect(response.harvest_orders.amount).to eq 5
    end
  end

  it "should allow for deleting a harvest order" do
    VCR.use_cassette :harvest_orders, 
      :record => :new_episodes, 
      :match_requests_on => [:path, :method] do

      response = client.delete_harvest_order(256)

      expect(response).to be_an_instance_of(Hashie::Mash)
      expect(response.harvest_orders.first.deleted_at.date).to eq "2019-02-27 14:38:12"
    end
  end

  it "should return harvest orders in json" do
    VCR.use_cassette :harvest_orders, 
      :record => :new_episodes, 
      :match_requests_on => [:path, :method] do

      response = client.harvest_orders

      expect(response).to be_an_instance_of(Hashie::Mash)
      expect(response.harvest_orders.first.id).to eq "253"
    end
  end 

  it "should return a specific harvest order in json" do
    VCR.use_cassette :harvest_orders, 
      :record => :new_episodes, 
      :match_requests_on => [:path, :method] do

      response = client.harvest_order(253)
      
      expect(response).to be_an_instance_of(Hashie::Mash)
      expect(response.harvest_orders.product_id).to eq "157704"
    end
  end 
  
end