Rails.application.routes.draw do
  
  root to: "homes#index"
  
  resources :messages
end
