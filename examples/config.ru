require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-agsquared-oauth2'
require 'agsquared-api-wrapper'

ENV['AGSQUARED_CONSUMER_KEY'] = 'farmersweb'
ENV['AGSQUARED_CONSUMER_SECRET'] = 'jyk0seaacpwwog4cgs0s0gw00k8wcg8'

# To run this example:
# $ bundle install
# $ rackup -p 9293 config.ru &

class App < Sinatra::Base
  get '/' do
    redirect '/auth/agsquared'
  end

  get '/auth/:provider/callback' do
    auth = request.env['omniauth.auth']
    
    client = AgsquaredApiWrapper::Client.new({
      consumer_token: ENV['AGSQUARED_CONSUMER_KEY'], 
      consumer_secret: ENV['AGSQUARED_CONSUMER_SECRET'], 
      oauth_token: auth.credentials.token, 
      oauth_secret: auth.credentials.secret
    })
    
    me = client.me
    
    erb "<h1>#{params[:provider]}</h1>
         <pre>#{JSON.pretty_generate(auth)}</pre>
         <pre>#{JSON.pretty_generate(me)}</pre>"
  end

  get '/auth/failure' do
    MultiJson.encode(request.env)
  end
end

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider OmniAuth::Strategies::AgsquaredOauth2, ENV['AGSQUARED_CONSUMER_KEY'], ENV['AGSQUARED_CONSUMER_SECRET'], :scope => "farmersWeb"
end

run App.new