# frozen_string_literal: true

module Types
  class MutationType < BaseObject
    field :create_status, mutation: Mutations::CreateStatus
    field :update_status, mutation: Mutations::UpdateStatus
  end
end
