Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  resources :users, :only =>[:index, :show, :edit, :update] 
  resources :books
  resources :homes, :only =>[:new, :index]
end