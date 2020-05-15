module Profitwell
  class Users
    include Client

     def subscriptions(user_alias = nil)
      request(
        "get",
        resource_path("users/#{user_alias}")
      )
    end

    def update(user_alias, params = {})
      request(
        "put",
        resource_path("users/#{user_alias}"),
        options: params
      )
    end

    def delete(user_alias)
      request(
        "delete",
        resource_path("users/#{user_alias}")
      )
    end
  end
end