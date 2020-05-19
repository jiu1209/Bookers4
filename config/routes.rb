Rails.application.routes.draw do
	root :to => "homes#index"
  devise_for :users, controllers: {registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  resources :users, :only =>[:index, :show, :edit, :update] 
  resources :books
  resources :homes, :only =>[:new]
  get "/home/about" => "homes#about"
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
  get "relationship/:user_id/follows" => "relationships#follows", as:'user_follows'
  get "relationship/:user_id/followers" => "relationships#followers", as:'user_followers'
end