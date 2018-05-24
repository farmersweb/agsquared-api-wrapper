require 'spec_helper'

describe AgsquaredApiWrapper::Client do
  it 'should instantiate with consumer key and consumer secret' do
    proc {
      AgsquaredApiWrapper::Client.new({
        consumer_token: ENV['AGSQUARED_CONSUMER_TOKEN'], 
        consumer_secret: ENV['AGSQUARED_CONSUMER_SECRET'], 
        access_token: ENV['AGSQUARED_ACCESS_TOKEN']
      })
    }.should_not raise_exception
  end

  describe "api_endpoint" do
    after(:each) do
      AgsquaredApiWrapper.reset
    end

    it "should default to http://api.agsquared.com/" do
      client = AgsquaredApiWrapper::Client.new
      client.api_endpoint.should == 'http://api.agsquared.com/'
    end

    it "should be set " do
      AgsquaredApiWrapper.api_endpoint = 'http://foo.dev'
      client = AgsquaredApiWrapper::Client.new
      client.api_endpoint.should == 'http://foo.dev/'
    end
  end
  
  describe "web_endpoint" do
    after(:each) do
      AgsquaredApiWrapper.reset
    end

    it "should default to http://www.agsquared.com/" do
      client = AgsquaredApiWrapper::Client.new
      client.web_endpoint.should == 'http://www.agsquared.com/'
    end

    it "should be set " do
      AgsquaredApiWrapper.web_endpoint = 'http://foo.dev'
      client = AgsquaredApiWrapper::Client.new
      client.web_endpoint.should == 'http://foo.dev/'
    end
  end
  
end