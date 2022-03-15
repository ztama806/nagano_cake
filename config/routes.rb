Rails.application.routes.draw do

  devise_for :admins, controllers: {
   sessions:      'admins/sessions',
   passwords:     'admins/passwords',
   registrations: 'admins/registrations'
  }

  namespace :admin do
   root :to => 'homes#top'
   resources :customers, only: [:index, :edit, :update, :show]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :items, only: [:show, :index, :new, :create, :edit, :update]
   resources :orders, only: [:show, :update]
   resources :order_details, only: [:update]
  end



  devise_for :publics, controllers: {
   sessions:      'publics/sessions',
   passwords:     'publics/passwords',
   registrations: 'publics/registrations'
  }

  scope module: 'public' do
    root 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only: [:show, :index]
   end

  namespace :public do
   resources :customers, only: [:show, :edit, :update]
   get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'customers_unsubscribe'
   patch 'customers/withdraw' => 'customers#withdraw', as: 'customers_withdraw'
   resources :cart_items, only: [:index, :create, :update, :destroy]
   delete 'cart_items' => 'cart_items#destroy_all', as: 'destroy_all'
   resources :orders, only: [:create, :new, :index, :show]
   post 'orders/confirm' => 'orders#confirm'
   get 'orders/complete' => 'orders#complete'
   resources :addresses, only: [:index, :create, :destroy, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
