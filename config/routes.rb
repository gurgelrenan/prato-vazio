Rails.application.routes.draw do
  resources :deputies
  root 'deputies#index'
end
