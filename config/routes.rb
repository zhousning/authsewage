Rails.application.routes.draw do
  root :to => 'sign_logs#index'

  #mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #get 'forget', to: 'admin/dashboard#index'
  #devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    #get 'forget', to: 'users/passwords#forget'
    #patch 'update_password', to: 'users/passwords#update_password'
    #post '/login_validate', to: 'users/sessions#user_validate'
    #
    #unauthenticated :user do
    #  root to: "devise/sessions#new",as: :unauthenticated_root #设定登录页为系统默认首页
    #end
    #authenticated :user do
    #  root to: "homes#index",as: :authenticated_root #设定系统登录后首页
    #end
  end

  #resources :users, :only => []  do
  #  get :center, :on => :collection
  #  get :alipay_return, :on => :collection
  #  post :alipay_notify, :on => :collection
  #  get :mobile_authc_new, :on => :member
  #  post :mobile_authc_create, :on => :member
  #  get :mobile_authc_status, :on => :member
  #end
  #resources :systems, :only => [] do
  #  get :send_confirm_code, :on => :collection
  #end


  resources :roles

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :properties
  resources :nests 
  resources :domains 

  resources :controls, :only => [:index]

  resources :templates do
    get :produce, :on => :member
  end

  resources :selectors

  resources :factories, :only => [] do
    resources :devices do
      post :parse_excel, :on => :collection
      get :xls_download, :on => :collection
      get :query_all, :on => :collection
      get :info, :on => :member
    end
    resources :inspectors, :only => [:index] do
      get :receive, :on => :member
      get :reject, :on => :member
    end
    resources :workers, :only => [:index, :destroy]  do 
      get :receive, :on => :member
      get :reject, :on => :member
      get :query_info, :on => :member
      get :signlogs, :on => :member
    end
  end

  resources :sign_logs do
    get :download_append, :on => :member
    get :query_all, :on => :collection
    get :query_list, :on => :collection
  end

  resources :grp_inspectors, :only => [:index]

  resources :grp_devices, :only => [:index] do
    collection do
      get 'query_all'
    end
  end

  resources :grp_workers, :only => [:index] do
    get :query_all, :on => :collection
    get :query_info, :on => :member
    get :signlogs, :on => :member
  end

  resources :wx_users, only: [:update] do
    collection do
      post 'get_userid'
      get 'fcts'
      get 'streets'
      get 'sites'
      get 'status'
      post 'set_fct'
    end
  end
  resources :wx_tasks, only: [] do
    collection do
      get 'query_all'
      get 'query_finish'
      get 'query_plan'
      get 'basic_card'
      get 'task_info'
      post 'report_create'
    end
  end
  resources :wx_resources, only: [] do
    collection do
      post 'img_upload'
    end
  end
  resources :wx_auths, only: [] do
    collection do
      post 'auth_process'
    end
  end

  resources :flower

end
