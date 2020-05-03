module Profitwell
  class Error < StandardError
    attr_reader :message, :type, :code, :error

    FAILED_HTTP_STATUSES = Array(400..599)

    def initialize(response)
      # body = JSON.parse(response.body)

      # @code = "#{response[:status]}"
      # @type = body['meta']['error_type']
      # @message = body['meta']['error_message']
      @code = response.code
      @error = FAILED_HTTP_STATUSES.include? response.code
      @message = response
    end
  end

  class RuntimeError < Error
  end

  class BadRequest < Error
  end

  class NotFound < Error
  end

  class BadGateway < Error
  end

  class Unauthorized < Error
  end
end