module Profitwell
  module Client
    def api_status
      request(
        "get",
        resource_path("api-status")
      )
    end
  end
end