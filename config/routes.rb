Rails.application.routes.draw do
 #管理者ログイン
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admin, controllers: {
   sessions:      'admin/sessions',
   passwords:     'admin/passwords',
   registrations: 'admin/registrations'
  }

  #管理者側
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    get '/' => 'homes#top'
  end


  #会員ログイン
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
  }


  #会員側
  scope module: :customers do
    resources :customers, only: [:show, :edit, :update]do
        collection do
          get 'customers/confirm' => 'customers#confirm'
          patch 'customers/out' => 'customers#out'
       end
    end
    resources :products, only: [:index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :create, :destroy]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/thanx' => 'orders#thanx'
    resources :orders, only: [:new, :create, :index, :show]

    resources :addresses, only: [:index, :create, :destroy, :edit, :update]
    root to: "homes#top"
    get 'about' => 'homes#about'
  end
end
