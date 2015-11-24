Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'


  #match 'movies/:id/similar', to: 'movies#similar', as: :similar_director, via: :get

  resources :movies do
    member do
      get 'similar'
    end
  end

  root :to => redirect('/movies')
  
end
