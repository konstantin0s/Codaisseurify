Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "artists#index"



  resources :artists do
      resources :songs, :only => [:create, :new, :destroy]
      resources :photos, :only => [:create, :new, :destroy]
  end

  #resources :photos


end
