# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static_endpoints#root'
  post '/graphql', to: 'graphql#execute'
end
