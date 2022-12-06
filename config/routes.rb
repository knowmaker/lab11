Rails.application.routes.draw do
  root "translate#input"
  get 'translate/output'
  get 'translate/xml'
  get 'translate/json'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
