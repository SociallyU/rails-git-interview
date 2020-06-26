Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "git_users#index"
  resources :git_users, only: [:show, :index, :create]
end
