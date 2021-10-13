Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:"homes#top"
  resources :books do
    resource :favorites ,only:[:create,:destroy]
    resource :comments ,only:[:create,:destroy]
  end
  resources :users ,only:[:show,:edit,:update]
  get "/search",to: "searchs#search"
end