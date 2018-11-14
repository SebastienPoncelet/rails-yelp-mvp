Rails.application.routes.draw do
  get 'admin/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :reviews, only: [:new, :create ]
  end

  namespace :admin do
    resources :restaurants, only: [:destroy]
  end
end
