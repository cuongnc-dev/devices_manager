Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions"}

  root "devices#index"
  resources :departments
  resources :devices
end
