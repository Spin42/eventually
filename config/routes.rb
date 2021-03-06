require "sidekiq/web"

Rails.application.routes.draw do
  root "private#index"

  mount Sidekiq::Web => "/sidekiq"

  namespace :api, defaults: { format: :json } do
    resources :events,                          only: [ :index ]
    resources :new_relic_server_reports,        only: [ :index ]
    resources :new_relic_application_reports,   only: [ :index ]
    resources :twitter_reports,                 only: [ :index ]
    resources :twitter_daily_reports,           only: [ :index ]
    resources :google_analytics_daily_reports,  only: [ :index ]
    resources :event_bus_reports,               only: [ :index ]
    resources :event_store_reports,             only: [ :index ]
    resources :sidekiq_reports,                 only: [ :index ]
    resources :applications,                    only: [ :index, :show, :create, :update ]
  end

  namespace :eventually_tracker_api, defaults: { format: :json } do
    resources :events, only: :create
  end
end
