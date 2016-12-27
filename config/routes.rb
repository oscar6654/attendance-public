Rails.application.routes.draw do



  #get 'code/index'

  # get 'users/show'
  # get 'users/index'

  devise_for :users, :controllers => { :confirmations => "confirmations" }
  resources :users, only: [:show, :index]
  resources :sheets, only: [:index, :new, :create, :edit, :update]
  resources :logouts, only: [:index,:new,:create]
  resources :workers, only: [:new, :create, :edit, :update]
  resources :memos, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :sellers, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :codes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :invoices, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :datas, only: [:index]
  resources :openeds, only: [:index]
  match 'coverages/:user_id/edit' => "coverages#edit", :via => :get, :as => :edit_cover
  resources :coverages, only: [:index,:new, :create, :show,:update]
  # resources :coverages, except: :edit
  # get 'coverages/:user_id' => 'coverages#edit', as: 'cover_edit'
  devise_scope :user do
  get "/users/sign_up",  :to => "welcome#index"
  end
    as :user do
        patch '/users/confirmation' => 'confirmations#update', :via => :patch, :as => :update_user_confirmation
    end
    # as :openeds do
    #   get 'openeds/edit_multiple' => 'openeds#edit_multiple', :as => 'edit_multiple'
    #   patch '/openeds/update_multiple' => 'openeds#update_multiple', :as => 'update_multiple'
    # end
  #match 'memos/:id' => 'memos#destroy', :via => :delete, :as => :destroy_memo
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  
  resources :invoices do
    collection {post :import}
  member do
    get :edit_invoice2
    put :update_invoice2
    patch :update_invoice2
    get :edit_invoice3
    put :update_invoice3
    patch :update_invoice3
    get :edit_invoice4
    put :update_invoice4
    patch :update_invoice4
    get :edit_invoice5
    put :update_invoice5
    patch :update_invoice5
    get :admin_edit_invoice_status
    put :admin_update_invoice_status
    patch :admin_update_invoice_status
    get :admin_edit_invoice_status_1
    put :admin_update_invoice_status_1
    patch :admin_update_invoice_status_1
    #get :opened
  end
end


  #devise_for :users
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/log'
  get 'sheet/index'
  get 'coverages/curr'
  get 'datas/users'
  get 'datas/invoices'
  get 'datas/time_in'
  #get 'invoices/opened'
  #get 'users/data'
  #resource :workers
  #mailboxer_email
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  
  #conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
      post :delete
    end
  end
  resources :openeds do
    collection do
      get :edit_multiple
      patch :update_multiple
      put :update_multiple
      post :edit_multiple
    end
  end
  
  root to: 'welcome#index'
end
