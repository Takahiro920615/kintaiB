Rails.application.routes.draw do
    # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
   
   root 'kintaipages#top'
   get 'users/new'
  
   get "search", to: "users#search"
 


  
  resources :kintaipages
  resources :users do
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendances/edit_one_month'
    end
    resources :attendances, only: :update
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
