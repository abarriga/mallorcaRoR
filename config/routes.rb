MallorcaRoR::Application.routes.draw do
  root :to => 'home#index'
  get 'home' => 'home#index', :as => 'home'
  get 'login' => 'users#login_index', :as => 'login'
  post 'login' => 'users#login', :as => 'login'
  get 'logout' => 'users#destroy_session', :as => 'logout'
  
  
  resources :meetups

  resources :users
  
  resources :blogs, :only => [:new, :create, :edit]
  get 'blog' => 'blogs#index', :as => 'blog'
  match 'blog.:id' => 'blogs#update', :via => :put
  match 'delete_blog.:id' => 'blogs#destroy', :as => 'delete_blog'
  
  resources :topics
end
