Rails.application.routes.draw do
  get 'api/v0/customers/:customer_id/subscriptions', to: 'api/v0/subscriptions#index'
  post 'api/v0/customers/:customer_id/subscriptions', to: 'api/v0/subscriptions#create'
  patch 'api/v0/customers/:customer_id/subscriptions/:id', to: 'api/v0/subscriptions#update'
end
