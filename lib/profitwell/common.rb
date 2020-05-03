module Profitwell
  module Common
    include HTTParty

    ERROR_CODES = {
      400 => BadRequest,
      401 => Unauthorized,
      404 => NotFound,
      502 => BadGateway,
    }.freeze

    def resource_path(path = nil, options = "")
      return "#{base_endpoint}/#{path}/?#{options}" if options.nil?

      "#{base_endpoint}/#{path}/"
    end

    def request(http_method, endpoint, options: {})
      response = HTTParty.send(http_method, endpoint, params(options).merge!(authorization_header))
      if response.success?
        parse_success response
      else
        parse_failed response
      end
    end

    private

    def params(values)
      {
        body: values.to_json
      }
    end

    def authorization_header
      @authorization_header ||= {
        headers: {
          'Content-Type': content_type,
          'Authorization': access_token
        }
      }
    end

    def parse_success(response)
      response_hash = response
    end

    def parse_failed(response)
      error = ERROR_CODES[response.code].new(response)
      raise error, error.message
    end

    def access_token
      raise 'Access token is missing' unless Profitwell.access_token
      @access_token ||= Profitwell.access_token
    end

    def content_type
      raise 'Content type is missing' unless Profitwell.content_type
      @content_type ||= Profitwell.content_type
    end

    def base_endpoint
      raise 'Base API endpoint is missing' unless Profitwell.base_endpoint
      @base_endpoint ||= Profitwell.base_endpoint
    end
  end
end
