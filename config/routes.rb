Rails.application.routes.draw do

  root to: "public/homes#top"

  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, controllers: {
  sessions: "admin/sessions"
  }

  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  resources :oders, only: [:new, :comfirm, :complete, :create, :index, :show]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  get'/admin' => 'admin/homes#top'

  namespace :admin do

    #resources :homes, only: [:top]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    patch'details' => 'dedails#update'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
