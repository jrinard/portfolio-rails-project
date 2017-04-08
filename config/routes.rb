Rails.application.routes.draw do

devise_for :users
root :to => 'projects#index'
# resources :about, :only => [:index]
# resources :home
resources :projects

end
