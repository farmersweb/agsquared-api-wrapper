# agsquared-api-client: An API Wrapper for AgSquared

It supports the AgSquared API which uses OAuth2.

## Usage

This gem does not contain any methods for authentication. Everyone tends to use something a little bit different, so the goal was to abstract out the OAuth authentication and allow you to bring your own, if you desire. You only need to supply the tokens. However, I also created an OmniAuth strategy to support the AgSquared API. So, if you're already using OmniAuth in your project, you can easily add the strategy with my omniauth-agsquared-oauth2 gem according to the instructions found here: [OmniAuth AgSquared oAuth2 Strategy](/farmersweb/omniauth-agsquared-oauth2)

Add the gem to your `Gemfile`:

```ruby
gem 'agsquared-api-client'
```

Then instantiate the client using the oAuth tokens (this example implies using Foreman and an .env file that contain these values):

```ruby
AgsquaredApiClient::Client.new({
  consumer_token: ENV['AGSQUARED_CONSUMER_TOKEN'], 
  consumer_secret: ENV['AGSQUARED_CONSUMER_SECRET'], 
  oauth_token: ENV['AGSQUARED_OAUTH_TOKEN'], 
  oauth_secret: ENV['AGSQUARED_OAUTH_SECRET']
})
```

The consumer_token and consumer_secret are supplied by AgSquared once you create a developer account and an app.

The oauth_token and oauth_secret are the access tokens that are received from the OAuth transaction. In this Sinatra method that uses the OmniAuth callback method, you can see how to parse the access tokens out of the response and use it to instantiate the AgsquaredApiClient client along with your pre-defined consumer tokens:

```ruby
get '/auth/:provider/callback' do
  auth = request.env['omniauth.auth']
  
  client = AgsquaredApiClient::Client.new({
    consumer_token: ENV['AGSQUARED_CONSUMER_KEY'], 
    consumer_secret: ENV['AGSQUARED_CONSUMER_SECRET'], 
    oauth_token: auth.credentials.token, 
    oauth_secret: auth.credentials.secret
  })
  
  products = client.products
  
  erb "<h1>#{params[:provider]}</h1>
       <pre>#{JSON.pretty_generate(auth)}</pre>
       <pre>#{JSON.pretty_generate(products)}</pre>"
end
```

Check the examples directory for a full example using Sinatra.

## Tests

Note that rspec is using vcr for fixtures. If you delete files from spec/fixtures/cassettes, the tests will fail. They use dummy tokens, and will attempt to communicate with the live API with missing OAuth parameters. In order to test against the live API and generate your own cassettes, create a .env file with the following parameters:

```ruby
	AGSQUARED_CONSUMER_TOKEN='your consumer token from AgSquared'
	AGSQUARED_CONSUMER_SECRET='your consumer secret from AgSquared'
	AGSQUARED_OAUTH_TOKEN='OAuth token that are returned from a successful authentication'
	AGSQUARED_OAUTH_SECRET='OAuth secret that are returned from a successful authentication'
```

From there, you can run _foreman run bundle exec rake_ to regenerate the cassettes using live data in conjunction with your credentials. Just a word of warning: don't commit those cassettes to a public repo, as they will contain valid tokens that could potentially be used to hijack a live application that uses those credentials.

## Todo


## Copyright

Copyright (c) 2018 John Barton. See [LICENSE](https://github.com/farmersweb/agsquared-api-client/blob/master/LICENSE.txt) for details.