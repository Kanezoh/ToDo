Rails.application.routes.draw do
  root 'categories#index'
  resources :categories,only:[:new,:create,:index,:show,:destroy] do
    resources :tasks,only:[:create,:edit,:update,:destroy]
  end
end
