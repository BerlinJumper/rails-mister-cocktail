Rails.application.routes.draw do
  resources :cocktails, only: [ :new, :create, :show, :index] do
    resources :doses, only: [ :new, :create, :destroy]
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
