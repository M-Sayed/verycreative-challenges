Rails.application.routes.draw do
  post 'balls/create'
  root to: 'balls#index'
end
