# frozen_string_literal: true

module Subscriptions
  class StatusChanged < BaseSubscription
    field :status, String, null: false
    argument :id, ID, required: true

    def subscribe(id:)
      {
        status: "You are subscribed to #{id}"
      }
    end
  end
end
