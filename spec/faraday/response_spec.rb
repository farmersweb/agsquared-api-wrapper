# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Faraday::Response do
  before do
    @client = AgsquaredApiWrapper::Client.new({
      consumer_token: ENV['AGSQUARED_CONSUMER_TOKEN'], 
      consumer_secret: ENV['AGSQUARED_CONSUMER_SECRET'], 
      access_token: ENV['AGSQUARED_ACCESS_TOKEN'],
      refresh_token: ENV['AGSQUARED_REFRESH_TOKEN']
      proxy: 'http://localhost:8888'
    })
  end

  {
    400 => AgsquaredApiWrapper::BadRequest,
    401 => AgsquaredApiWrapper::Unauthorized,
    403 => AgsquaredApiWrapper::Forbidden,
    404 => AgsquaredApiWrapper::NotFound,
    406 => AgsquaredApiWrapper::NotAcceptable,
    422 => AgsquaredApiWrapper::UnprocessableEntity,
    500 => AgsquaredApiWrapper::InternalServerError,
    # 501 => AgsquaredApiWrapper::NotImplemented,
    502 => AgsquaredApiWrapper::BadGateway,
    503 => AgsquaredApiWrapper::ServiceUnavailable,
  }.each do |status, exception|
    context "when HTTP status is #{status}" do

      before do
        stub_get('me').to_return(:status => status)
      end

      it "should raise #{exception.name} error" do
        lambda do
          @client.me
        end.should raise_error(exception)
      end
    end
  end
end