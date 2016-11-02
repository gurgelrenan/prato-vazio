Rails.application.routes.draw do
  resources :congressmen
  root 'congressmen#index'
end
