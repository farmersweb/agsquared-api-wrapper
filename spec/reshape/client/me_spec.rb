require 'spec_helper'

describe AgsquaredApiWrapper::Client::Me do
  let(:client) do
    agsquared_client
  end
  
  after(:each) do
    agsquared_client.reset
  end

  it "should return farm-specific info in json" do
    VCR.use_cassette('me') do
      response = client.me
      response.should be_an_instance_of(Hashie::Mash)
      response.result.should == 'success'
    end
  end 
  
end