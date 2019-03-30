# frozen_string_literal: true

module Mutations
  class CreateStatus < BaseMutation
    field :id, String, null: false

    def resolve
      {
        id: UUID.new.generate
      }
    end
  end
end
