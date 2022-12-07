Rails.application.routes.draw do
  resources :messages, except: [:edit, :update] 
  get 'tags/:name/messages', to: 'tags#show', as: 'tag_name'

  root 'messages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
