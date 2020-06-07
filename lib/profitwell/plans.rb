module Profitwell
  class Plans
    include Request

    def all
      request(
        "get",
        resource_path("plans")
      )
    end

    def find(plan_id)
      request(
        "get",
        resource_path("plans/#{plan_id}")
      )
    end

    def create(params = {})
      request(
        "post",
        resource_path("plans"),
        options: params
      )
    end

    def update(plan_id, params = {})
      request(
        "put",
        resource_path("plans/#{plan_id}"),
        options: params
      )
    end

    private

    def a_request
      response = HTTParty.send("get", Profitwell.base_endpoint + "/plans/",  headers: {
        'Content-Type': Profitwell.content_type,
        'Authorization': Profitwell.access_token
      })
    end
  end
end