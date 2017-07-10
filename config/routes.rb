Rails.application.routes.draw do
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/help", to: "static_pages#help"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  devise_scope :user do
    get "login", to: "users/sessions#new"
    post "login", to: "users/sessions#create"
    get "signup", to: "users/registrations#new"
    post "signup", to: "users/registrations#create"
    delete "signout", to: "users/sessions#destroy"
  end
  concern :paginatable do
    get "(page/:page)", action: :index, on: :collection, as: ""
  end

  resources :users, concerns: :paginatable
  resources :posts
end
