Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  get "/pages/*id" => 'pages#show', as: :page, format: false
end
