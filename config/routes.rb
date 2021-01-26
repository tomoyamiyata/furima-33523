Rails.application.routes.draw do

  devise_for :users

  #devise_for :users

  get 'items/index'
  root to: "items#index"
 
  
 
end
