Rails.application.routes.draw do
  devise_for :users

  resources :profiles, only: [:show, :edit, :update]
  resources :create_user, only: [:new, :create]

  resources :chats do
    resources :messages
  end

  root "profiles#show"
  match '/profiles/get_unread_messages', to: 'profiles#unread_messages', as: 'unread_messages', via: :post
  #match 'profiles/new_user', :to => 'profiles#new_user', :as => 'new_user', :via => :post

end
