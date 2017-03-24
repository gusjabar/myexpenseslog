Rails.application.routes.draw do
  resources :expensives
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "expensives#index"
  resources :categories
  resources :subcategories

 # map.connect 'api/catalog/:id', :controller => 'catalog', :action => 'getSubcategories'

  namespace :api, :except => [:new, :edit, :index, :create, :update, :destroy, :show] do
    get 'catalog/getSubcategories/:id', :to => 'catalog#getSubcategories', :defaults => {:format => 'json'}

  end
end
