Rails.application.routes.draw do
  devise_for :users
  resources :pr_lists do
    resources :pr_items
  end
  namespace :pr_list do
    resources :pr_items
  end
  root 'home#landing'
  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
