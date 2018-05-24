require 'spec_helper'

describe AgsquaredApiWrapper::Client do
  it 'should instantiate with consumer key and consumer secret' do
    expect(proc {
      AgsquaredApiWrapper::Client.new({
        consumer_token: ENV['AGSQUARED_CONSUMER_TOKEN'], 
        consumer_secret: ENV['AGSQUARED_CONSUMER_SECRET'], 
        access_token: ENV['AGSQUARED_ACCESS_TOKEN']
      })
    }).not_to raise_exception
  end

  describe "api_endpoint" do
    after(:each) do
      AgsquaredApiWrapper.reset
    end

    it "should default to https://api.agsquared.com/" do
      client = AgsquaredApiWrapper::Client.new
      expect(client.api_endpoint).to eq 'https://api.agsquared.com/'
    end

    it "should be set " do
      AgsquaredApiWrapper.api_endpoint = 'http://foo.dev'
      client = AgsquaredApiWrapper::Client.new
      expect(client.api_endpoint).to eq 'http://foo.dev/'
    end
  end
  
  describe "web_endpoint" do
    after(:each) do
      AgsquaredApiWrapper.reset
    end

    it "should default to https://www.agsquared.com/" do
      client = AgsquaredApiWrapper::Client.new
      expect(client.web_endpoint).to eq 'https://www.agsquared.com/'
    end

    it "should be set " do
      AgsquaredApiWrapper.web_endpoint = 'http://foo.dev'
      client = AgsquaredApiWrapper::Client.new
      expect(client.web_endpoint).to eq 'http://foo.dev/'
    end
  end
  
end