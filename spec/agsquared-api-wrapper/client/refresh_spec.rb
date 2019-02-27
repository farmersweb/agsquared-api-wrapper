require 'spec_helper'

describe AgsquaredApiWrapper::Client::Me do
  let(:client) do
    agsquared_client
  end
  
  after(:each) do
    agsquared_client.reset
  end

  it "should return farm-specific info in json" do
    VCR.use_cassette('refresh') do
      response = client.refresh!
      expect(response).to be_an_instance_of(Hashie::Mash)
      expect(response['access_token']).to eq "3d84c5e681c4a01a55746c3561202c1d9e3472f0"
    end
  end 
  
end