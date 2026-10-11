Rails.application.routes.draw do
  get "responders/index"
  get "responders/show"
  get "responders/update"
  get "citizens/new"
  get "citizens/create"
  # الصفحة الرئيسية للنظام
  root 'home#index'
  get 'home/index', to: 'home#index'

  # مسارات المصادقة وتسجيل الدخول (Sessions)
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # مسارات تقديم البلاغات للمواطنين (Citizens)
  resources :citizens, only: [:new, :create, :index, :show]

  # مسارات لوحة تحكم المستجيبين (Responders)
  resources :responders, only: [:index, :show, :update]

  # مسارات إدارة المستخدمين للمشرفين (Admin)
  namespace :admin do
    resources :users, only: [:index, :edit, :update] do
      member do
        patch :toggle_active
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end 