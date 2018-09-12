Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: 'employees#desboart'
    
    resources :employees do
      collection do
        get  :forget_password
        post :forget_password
        get  :reset_mail
        get  :error_mail
        get  :add_roles
        post :save_roles
        get  :desboart
      end
    end

    resources :users do
      collection do
        root to: 'users#index'
        get  :desboart
      end
    end
  end

  namespace :web do
    resources :center do
      collection do
        get :my_vendor
        get :my_visit
        get :my_search
        get :visits_converse_create 
      end
    end
  end

  resources :vendors do
    collection do
      post :upload_image
      get :show_gps
      get :add_comments
      get :top_search
      get :details
      get :review
    end
  end

  #root to: '/admin/employees'
  root to: 'admin/employees#index'
  # root to: 'vendors#index'
  devise_for :employees, path: "admin", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', sign_up: 'cmon_let_me_in' }, controllers: { sessions: "admin/sessions", passwords: "admin/passwords"}
  devise_for :users, path: "web", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', sign_up: 'cmon_let_me_in' }, controllers: { sessions: "web/sessions", passwords: "web/passwords"}

end
