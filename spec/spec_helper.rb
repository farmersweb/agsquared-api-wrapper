unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter "/spec"
  end
end

require 'agsquared-api-wrapper'
require 'rspec'
require 'webmock/rspec'
require 'vcr'
require 'dotenv'
require 'awesome_print'
Dotenv.load('.env')

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
  c.ignore_localhost = true
  c.allow_http_connections_when_no_cassette = true
end

def a_get(url)
  a_request(:get, agsquared_url(url))
end

def a_post(url)
  a_request(:post, agsquared_url(url))
end

def a_put(url)
  a_request(:put, agsquared_url(url))
end

def a_delete(url)
  a_request(:delete, agsquared_url(url))
end

def stub_get(url)
  stub_request(:get, agsquared_url(url))
end

def stub_post(url)
  stub_request(:post, agsquared_url(url))
end

def stub_put(url)
  stub_request(:put, agsquared_url(url))
end

def stub_delete(url)
  stub_request(:delete, agsquared_url(url))
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def agsquared_url(url)
  "http://api.agsquared.com/#{@client.api_version}/#{url}"
end

def agsquared_client
  AgsquaredApiWrapper::Client.new({
    consumer_token: ENV['AGSQUARED_CONSUMER_TOKEN'], 
    consumer_secret: ENV['AGSQUARED_CONSUMER_SECRET'], 
    access_token: ENV['AGSQUARED_ACCESS_TOKEN'], 
    refresh_token: ENV['AGSQUARED_REFRESH_TOKEN'], 
    uid: ENV['AGSQUARED_UID'],
    subscription_id: ENV['AGSQUARED_SUBSCRIPTION_ID']
  })
end
