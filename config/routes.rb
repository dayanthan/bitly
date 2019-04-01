Rails.application.routes.draw do
  resources :posts
  get '/:id', to: "posts#shortened_url", as: 'shortened_url'
  root :to => "posts#new"
end
