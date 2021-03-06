Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :comments
  resources :pictures, only: [:index,:show]
  resources :articles , only: [:index,:show]do
    collection do
      get :top_search
      post :upload_image
      get :add_comments
      get :add_view_count
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
      get :add_review
    end
  end

  namespace :admin do
    root to: 'employees#desboart'
    resources :categories do
      collection do
        get :show_name
      end  
    end
    resources :comments do
      collection do
        get :show_name
      end  
    end  

    resources :permissions do
      collection do
        get :show_name
        get  :add_roles
        post :save_roles
      end  
    end

    resources :roles do
      collection do
        get  :add_permissions
        post :save_permissions
        get  :add_employees
        post :save_employees
      end  
    end 

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

    resources :articles do
      collection do
        post :upload_image
      end
    end

    resources :pictures do
      collection do
        post :upload_image
        get :show_gps
      end
    end

    resources :users do
      collection do
        post :create_import_users
        get :import_users
      end
    end

    resources :vendors do
      collection do
        post :upload_image
        get :show_gps
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

  #root to: '/admin/employees'
  #root to: 'admin/employees#index'
  root to: 'vendors#review'
  devise_for :employees, path: "admin", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', sign_up: 'cmon_let_me_in' }, controllers: { sessions: "admin/sessions", passwords: "admin/passwords"}
  devise_for :users, path: "web", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', sign_up: 'cmon_let_me_in' }, controllers: { sessions: "web/sessions", passwords: "web/passwords"}

end
