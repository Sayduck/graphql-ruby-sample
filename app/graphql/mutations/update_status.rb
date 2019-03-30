# frozen_string_literal: true

module Mutations
  class UpdateStatus < BaseMutation
    field :success, Boolean, null: false

    argument :id, String, required: true

    def resolve(id:)
      trigger

      {
        success: true
      }
    end

    private

    def trigger
      GraphqlSchema.subscriptions.trigger(:status_changed,
                                          { id: id },
                                          status: "New status #{Time.now.to_i}")
    end
  end
end
