module AgsquaredApiWrapper
  # Custom error class for rescuing from all AgSquared errors
  class Error < StandardError; end

  # Raised when AgSquared returns a 400 HTTP status code
  class BadRequest < Error; end

  # Raised when AgSquared returns a 401 HTTP status code
  class Unauthorized < Error; end

  # Raised when AgSquared returns a 403 HTTP status code
  class Forbidden < Error; end

  # Raised when AgSquared returns a 404 HTTP status code
  class NotFound < Error; end

  # Raised when AgSquared returns a 406 HTTP status code
  class NotAcceptable < Error; end

  # Raised when AgSquared returns a 422 HTTP status code
  class UnprocessableEntity < Error; end

  # Raised when AgSquared returns a 500 HTTP status code
  class InternalServerError < Error; end

  # Raised when AgSquared returns a 502 HTTP status code
  class BadGateway < Error; end

  # Raised when AgSquared returns a 503 HTTP status code
  class ServiceUnavailable < Error; end
end
