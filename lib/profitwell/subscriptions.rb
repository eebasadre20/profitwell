module Profitwell
  class Subscriptions
    include Request

    # params values
    def create(params = {})
      request(
        "post",
        resource_path("subscriptions"),
        options: params
      )
    end

    # subscription_alias
    # params values
    def update(subscription_alias, params = {})
      request(
        "put",
        resource_path("subscriptions/#{subscription_alias}"),
        options: params
      )
    end

    # subscription_alias
    # churn_type - [voluntary, delinquent]
    # effective_date
    def churn(subscription_alias, effective_date, churn_type = 'voluntary')
      request(
        "delete",
        resource_path("subscriptions/#{subscription_alias}", "effective_date=#{effective_date}&churn_type=#{churn_type}")
      )
    end

    def unchurn(subscription_alias)
      request(
        "put",
        resource_path("unchurn/#{subscription_alias}")
      )
    end
  end
end