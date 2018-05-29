require 'spec_helper'

describe AgsquaredApiWrapper::Client::Farm do
  let(:client) do
    agsquared_client
  end
  
  after(:each) do
    agsquared_client.reset
  end

  it "should return farm-specific product info in json" do
    VCR.use_cassette('products') do
      response = client.products
      expect(response).to be_an_instance_of(Hashie::Mash)
      expect(response['products'][0]['id']).to eq "150627"
    end
  end 

  it "should return farm-specific plantings info in json" do
    VCR.use_cassette('plantings') do
      response = client.plantings
      expect(response).to be_an_instance_of(Hashie::Mash)
      expect(response['plantings'][0]['id']).to eq "377847"
    end
  end 
  
end