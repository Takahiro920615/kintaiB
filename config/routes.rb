Rails.application.routes.draw do
    # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
   
   root 'kintaipages#top'
   get 'users/new'
  
  #ログイン機
 


  
  resources :kintaipages
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
