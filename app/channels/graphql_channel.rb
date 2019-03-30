# frozen_string_literal: true

class GraphqlChannel < ApplicationCable::Channel
  def subscribed
    @subscription_ids = []
  end

  def execute(data)
    result = GraphqlSchema.execute(query: data['query'],
                                   operation_name: data['operationName'],
                                   variables: ensure_hash(data['variables']),
                                   context: {
                                     channel: self
                                   })

    if result.context[:subscription_id]
      @subscription_ids << result.context[:subscription_id]
    end

    if result.to_h['errors']
      logger.error "Errors #{result.to_h['errors'].inspect}"
    end

    data = {
      result: result.to_h,
      more: result.subscription?
    }

    transmit(data)
  end

  def unsubscribed
    @subscription_ids.each do |sid|
      GraphqlSchema.subscriptions.delete_subscription(sid)
    end
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
