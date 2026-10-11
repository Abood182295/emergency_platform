Rails.application.routes.draw do
  get "incidents/create"
  get "incidents/new"
  get "incidents/index"
  get "incidents/show"
  # الصفحة الرئيسية للنظام أصبحت صفحة تسجيل الدخول
  root 'sessions#new'
  
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "responders/index"
  get "responders/show"
  get "responders/update"
  get "citizens/new"
  get "citizens/create"
  
  get 'home/index', to: 'home#index'

  # مسارات المصادقة وتسجيل الدخول (Sessions)
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # مسارات تقديم البلاغات للمواطنين (Citizens)
  resources :citizens, only: [:new, :create, :index, :show]

  # مسارات البلاغات الحقيقية (Incidents) لحل مشكلة زر الإرسال
  resources :incidents, only: [:new, :create, :index, :show]

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
end