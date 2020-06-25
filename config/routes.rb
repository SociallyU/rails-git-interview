Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "git_services#index"
  resources :git_services, only: [:show, :index, :create]
end
