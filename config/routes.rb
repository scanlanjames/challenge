Rails.application.routes.draw do
  get 'stats', to: 'stats#index'
  get 'stats/:entity_type/:entity_id', to: 'stats#single'
  post 'tag', to: 'tags#create'
  get 'tags/:entity_type/:entity_id', to: 'tags#index'
  delete 'tags/:entity_type/:entity_id', to: 'tags#deletesingle' 
  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
