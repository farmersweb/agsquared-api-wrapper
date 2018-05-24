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
      expect(response['access_token']).to eq "458dd516d44662bd775588feb6d72156a9809070"
    end
  end 
  
end