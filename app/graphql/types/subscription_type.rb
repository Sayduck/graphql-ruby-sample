# frozen_string_literal: true

module Types
  class SubscriptionType < BaseObject
    extend GraphQL::Subscriptions::SubscriptionRoot

    field :status_changed, subscription: Subscriptions::StatusChanged
  end
end
