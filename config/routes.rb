Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :items, except: [:destroy]
    resources :genres, except: [:destroy, :show, :new]
    resources :customers, except: [:destroy, :new, :create]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about", as: "about"
    get "customers/my_page" => "customers#show", as: "my_page"
    get "customers/information/edit" => "customers#edit"
    get "customers/confirm" => "customers#confirm"
    post "customers/withraw" => "customers#withdraw"
    patch "customers/information" => "customers#update"

    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, except: [:show, :new, :edit]
    resources :items, only: [:index, :show]
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources :orders, execpt: [:update, :destroy, :edit]
    resources :addresses, except: [:show, :new]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end