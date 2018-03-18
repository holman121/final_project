Rails.application.routes.draw do

  get 'accessories/index', to: 'accessories#index'

  get 'accessories/show', to: 'accessories#show'

  get 'shoes/index', to: 'shoes#index'

  get 'shoes/show', to: 'shoes#show'

  get 'clothings/index', to: 'clothings#index'

  get 'clothings/show', to: 'clothings#show'

  root to: 'clothings#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
