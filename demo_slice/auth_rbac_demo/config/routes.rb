Rails.application.routes.draw do
  root "sessions#new"

  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  get "/dashboard", to: "dashboards#show", as: :dashboard
  get "/dashboard/:role", to: "dashboards#role",
      as: :role_dashboard,
      constraints: { role: /administrator|coordinator|responder/ }
  get "/access-denied", to: "sessions#access_denied", as: :access_denied
end
