module Profitwell
  module Request
    include HTTParty

    def resource_path(path = nil, options = "")
      return "#{base_endpoint}/#{path}/?#{options}" if options.nil?

      "#{base_endpoint}/#{path}/"
    end

    def request(http_method, endpoint, options: {})
      response = HTTParty.send(http_method, endpoint, request_params(options))
      parsed_response(response)
    end

    private

    def request_params(options)
      params_with_options(options).merge!(authorization_header)
    end

    def params_with_options(values)
      { body: values.to_json }
    end

    def authorization_header
      @authorization_header ||= {
        headers: {
          'Content-Type': content_type,
          'Authorization': access_token
        }
      }
    end

    def parsed_response(response)
      Response.create(response)
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
