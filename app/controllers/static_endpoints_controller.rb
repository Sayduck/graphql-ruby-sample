# frozen_string_literal: true

class StaticEndpointsController < ApplicationController
  def root
    render json: { hello: :world }
  end
end
