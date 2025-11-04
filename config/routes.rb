# frozen_string_literal: true

Rails.application.routes.draw do
  root 'api/tickets#index'

  namespace :api do
    resources :tickets, only: %i[index create]
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
