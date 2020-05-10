require "httparty"
require "oj"
require "profitwell/configuration"
require "profitwell/exception"
require "profitwell/common"
require "profitwell/client"
require "profitwell/users"
require "profitwell/subscriptions"
require "profitwell/plans"
require "profitwell/version"

module Profitwell
  class Error < StandardError; end

  extend Configuration

  RESOURCES = %w(users plans subscriptions)

  class << self
    RESOURCES.each do | resource |
      define_method resource do | resource_id = nil |
        klass_name(resource).new
      end
    end

    private

    def klass_name(resource)
      "Profitwell::#{resource.capitalize}".split("::").inject(Object) { |o, c| o.const_get c }
    end
  end
end
