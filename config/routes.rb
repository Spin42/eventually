require "sidekiq/web"

Rails.application.routes.draw do
  root "private#index"

  mount Sidekiq::Web => "/sidekiq"

  namespace :api, defaults: { format: :json } do
    resources :events,                        only: :create
    resources :new_relic_server_reports,      only: [ :index, :create ]
    resources :new_relic_application_reports, only: [ :index, :create ]
    resources :twitter_reports,               only: [ :index, :create ]
    resources :google_analytics_reports,      only: [ :index, :create ]
  end

  namespace :eventually_tracker_api, defaults: { format: :json } do
    resources :events, only: :create
  end
end
