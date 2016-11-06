Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users, only: [:index, :show] do
    resources :tasks
    resources :submit_requests , shallow: true do
      get 'approve'
      get 'unapprove'
      get 'reject'
      collection do
        get 'inbox'
      end
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :blogs do
    resources :comments
    collection do
      post :confirm
    end
  end
  resources :conversations do
    resources :messages
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  resources :contacts, only: [:index,:new, :create] do
    collection do
      post :confirm
    end
  end
  root 'top#index'
  post 'contacts/new' => 'contacts#new'
  post 'blogs/new' => 'blogs#new'
end
