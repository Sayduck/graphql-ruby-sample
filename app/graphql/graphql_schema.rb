# frozen_string_literal: true

class GraphqlSchema < GraphQL::Schema
  use GraphQL::Execution::Interpreter
  use GraphQL::Subscriptions::ActionCableSubscriptions

  query Types::QueryType
  subscription Types::SubscriptionType
  mutation Types::MutationType
end

GraphqlSchema.graphql_definition
