Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks"}
  resources :blogs do
    resources :comments
      collection do
        post :confirm
    end
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

  #"戻る"ボタン実行時のnewアクションにPOSTを追加する。
  post 'contacts/new' => 'contacts#new'
  post 'blogs/new' => 'blogs#new'

end
