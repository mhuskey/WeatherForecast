Rails.application.routes.draw do
  
  root 'forecast#index'
  post 'index', to: 'forecast#index'
  
end
