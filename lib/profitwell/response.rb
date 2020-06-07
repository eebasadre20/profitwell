module Profitwell
  module Response
    FAILED_HTTP_STATUSES = Array(400..599)
    ERROR_CODES = {
      400 => BadRequest,
      401 => Unauthorized,
      404 => NotFound,
      502 => BadGateway,
    }.freeze

    def self.create(response)
      data = Response.error(response)
      data = Response.translate_to_hash_object(response.parsed_response.dup)
      data.extend(self)
        data.instance_exec do
          %w{code}.each do | key |
              response.public_send(key).tap do | value |
              instance_variable_set("@#{key}", value) if value
          end
        end
      end

      data
    end

    def self.error(response)
      if FAILED_HTTP_STATUSES.include? response.code
        error_message = Response.error_message(response)
        binding.pry
        error = ERROR_CODES[response.code].new(error_message)

        raise error
      end
    end

    def self.translate_to_hash_object(data)
      return data.map! { | datum | ::Hashie::Mash.new(datum) } if data.is_a? Array
      data = ::Hashie::Mash.new(data)

      data
    end

    def self.error_message(response)
      response.parsed_response.keys.each do | key |
        return response.parsed_response[key].first || ""
      end
    end

    attr_reader :parsed_response, :code
  end
end