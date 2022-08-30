Rails.application.routes.draw do
  root 'kintaipages#top'
  
  resources :kintaipages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
