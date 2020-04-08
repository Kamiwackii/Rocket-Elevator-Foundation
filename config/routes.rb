Rails.application.routes.draw do
  
  
  devise_for :users
  devise_for :employees, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :pages
  resources :quote
  resources :leads
  resources :interventions
  
  root 'leads#new'

  get 'index' => 'leads#new' # index
  get 'corporate' => 'pages#corporate' # corporate
  get 'residential' => 'pages#residential' # residential
  get 'quoteform' => 'quote#new' # quote form
  get 'login' => 'pages#login'
  get 'sign_up' => 'users#sign_up'
  get 'sign_in' => 'users#sign_in'
  get 'leads' => 'leads#new'
  get 'interv' => 'interventions#new'
  get 'welcome' => 'watson#welcome'

  get 'get_building_by_customer/:customer_id', to: 'interventions#get_building_by_customer'  
  get 'get_battery_by_building/:building_id', to: 'interventions#get_battery_by_building'
  get 'get_column_by_battery/:battery_id', to: 'interventions#get_column_by_battery'  
  get 'get_elevator_by_column/:column_id', to: 'interventions#get_elevator_by_column'  
  # get '/building_search' => 'interventions#building_search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
