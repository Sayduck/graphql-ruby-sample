# frozen_string_literal: true

class GraphqlController < ApplicationController
  # POST /graphql
  def execute
    render json: GraphqlSchema.execute(
      query: params[:query],
      operation_name: params[:operationName],
      variables: ensure_hash(params[:variables]),
      context: {}
    )
  end

  private

  def ensure_hash(ambiguous_param) # rubocop:disable Metrics/MethodLength
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end
end
