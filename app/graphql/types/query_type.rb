# frozen_string_literal: true

module Types
  class QueryType < BaseObject
    field :hello, String, null: false, description: 'Hello World'

    def hello
      'World'
    end
  end
end
