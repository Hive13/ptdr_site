Rails.application.routes.draw do
  resources :waiver_forms, only: [:new, :create]
  get '/thanks' => 'waiver_forms#thank_you', as: 'thank_you_waiver_forms'
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  get "/pages/*id" => 'pages#show', as: :page, format: false
end
