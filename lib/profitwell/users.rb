module Profitwell
  class Users
    include Client

     def subscriptions(user_alias = nil)
      request(
        "get",
        resource_path("users/#{user_alias}")
      )
    end
  end
end