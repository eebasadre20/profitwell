module Profitwell
  class Error < StandardError
    def initialize(message)
      super(message)
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