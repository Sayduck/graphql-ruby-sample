# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    null true
  end
end
