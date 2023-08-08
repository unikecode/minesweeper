Rails.application.routes.draw do
  root 'boards#new'
  resources :boards, only: [:new, :create, :show, :index]
end
