Rails.application.routes.draw do

  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
  }

    devise_for :admin, controllers: {
  sessions: "admin/sessions"
  }

  root to: "public/homes#top"
  get"about" => "public/homes#about"

  get "customers/my_page" => "public/customers#show"
  get "customers/infomation/edit" => "public/customers#edit"
  patch "customers/infomation" => "public/customers#update"
  get "customers/unsubscribe" => "public/customers#unsubscribe"
  patch "customers/withdraw" => "public/customers#withdraw"


  scope module: :public do

    delete "cart_items_destroy_all" => "cart_items#destroy_all"
    post "orders/confirm" => "orders#confirm"
    get "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"

    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  get'/admin' => 'admin/homes#top'

  namespace :admin do

    resources :homes, only: [:top]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    #patch'details' => 'dedails#update'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
