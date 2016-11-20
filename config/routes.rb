Rails.application.routes.draw do
  devise_for :users
  resources :user_applications
  resources :artefact_filters
  resources :api_keys
  resources :users
  resources :permissions
  resources :applications
  resources :source_vcs
  resources :source_vcs_repositories
  resources :source_vcs_servers
  resources :sources
  resources :configurations
  resources :deployments
  resources :environments
  resources :environment_groups
  resources :artefacts

  get 'dashboard', to: 'dashboard#index'

  # external api
  namespace :api, defaults: { format: 'json' } do
    resources :deployments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
