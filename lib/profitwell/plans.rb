module Profitwell
  class Plans
    include Client

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
  end
end