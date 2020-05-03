module Profitwell
  module Configuration
    VALID_OPTIONS_KEYS = [
      :access_token,
      :version,
      :base_endpoint,
      :content_type,
    ].freeze

    DEFAULT_ACCESS_TOKEN  = nil
    DEFAULT_VERSION       = "v2".freeze
    DEFAULT_BASE_ENDPOINT      = "https://api.profitwell.com/v2".freeze
    DEFAULT_CONTENT_TYPE  = "application/json".freeze

    attr_accessor *VALID_OPTIONS_KEYS

    def self.extended(base)
      base.reset
    end

    def config
      yield self if block_given?
    end

    def reset
      self.access_token = DEFAULT_ACCESS_TOKEN
      self.version      = DEFAULT_VERSION
      self.base_endpoint     = DEFAULT_BASE_ENDPOINT
      self.content_type = DEFAULT_CONTENT_TYPE
    end
  end
end