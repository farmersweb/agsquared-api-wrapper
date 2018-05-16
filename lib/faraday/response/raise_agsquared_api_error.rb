require 'faraday'
require 'multi_json'

module Faraday
  class Response::RaiseAgsquaredApiError < Response::Middleware
    def on_complete(response)
      case response[:status].to_i
      when 400
        raise AgsquaredApiWrapper::BadRequest, error_message(response)
      when 401
        raise AgsquaredApiWrapper::Unauthorized, error_message(response)
      when 403
        raise AgsquaredApiWrapper::Forbidden, error_message(response)
      when 404
        raise AgsquaredApiWrapper::NotFound, error_message(response)
      when 406
        raise AgsquaredApiWrapper::NotAcceptable, error_message(response)
      when 422
        raise AgsquaredApiWrapper::UnprocessableEntity, error_message(response)
      when 500
        raise AgsquaredApiWrapper::InternalServerError, error_message(response)
      when 502
        raise AgsquaredApiWrapper::BadGateway, error_message(response)
      when 503
        raise AgsquaredApiWrapper::ServiceUnavailable, error_message(response)
      end
    end

    def error_message(response)
      message = if (body = response[:body]) && !body.empty?
        if body.is_a?(String)
          body = MultiJson.load(body, :symbolize_keys => true)
        end
        ": #{body[:error] || body[:message] || ''}"
      else
        ''
      end
      "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{response[:status]}#{message}"
    end
  end
end
