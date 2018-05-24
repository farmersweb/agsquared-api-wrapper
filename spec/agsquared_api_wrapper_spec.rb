# -*- encoding: utf-8 -*-
require 'spec_helper'

describe AgsquaredApiWrapper do
  after do
    AgsquaredApiWrapper.reset
  end

  describe ".respond_to?" do
    it "should be true if method exists" do
      expect(AgsquaredApiWrapper.respond_to?(:new, true)).to be_truthy
    end
  end

  describe ".new" do
    it "should be a AgsquaredApiClient::Client" do
      expect(AgsquaredApiWrapper.new).to be_a AgsquaredApiWrapper::Client
    end
  end

end
