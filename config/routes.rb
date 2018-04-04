Rails.application.routes.draw do

  get 'abouts/index'

  # get 'accessories/index', to: 'accessories#index'
  #
  # get 'accessories/show', to: 'accessories#show'
  #
  # get 'shoes/index', to: 'shoes#index'
  #
  # get 'shoes/show', to: 'shoes#show'
  #
  # get 'clothings/index', to: 'clothings#index'
  #
  # get 'clothings/show', to: 'clothings#show'
  #

  resources :accessories
  resources :shoes
  resources :clothings, only: [:index, :show, :recent_update] do
    collection do
      post :clear_shopping_cart
    end

    member do
      post :add_to_shopping_cart
      post :delete_from_shopping_cart
      post :delete_one_item_from_shopping_cart
    end
  end
  resources :abouts

  root to: 'clothings#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
