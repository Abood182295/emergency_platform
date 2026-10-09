Rails.application.routes.draw do
  root "home#index"

  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    resources :users, only: [:index, :edit, :update] do
      member do
        patch :toggle_active
      end
    end
  end
end