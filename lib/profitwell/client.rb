module Profitwell
  module Client
    include Common

    def api_status
      request(
        "get",
        resource_path("api-status")
      )
    end
  end
end