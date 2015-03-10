Rails.application.routes.draw do
 	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	post '/logout', to: 'sessions#destroy'

  resources :ideas
  resources :users
end

#   Prefix Verb   URI Pattern               Controller#Action
#     login GET    /login(.:format)          sessions#new
#           POST   /login(.:format)          sessions#create
#    logout POST   /logout(.:format)         sessions#destroy
#     ideas GET    /ideas(.:format)          ideas#index
#           POST   /ideas(.:format)          ideas#create
#  new_idea GET    /ideas/new(.:format)      ideas#new
# edit_idea GET    /ideas/:id/edit(.:format) ideas#edit
#      idea GET    /ideas/:id(.:format)      ideas#show
#           PATCH  /ideas/:id(.:format)      ideas#update
#           PUT    /ideas/:id(.:format)      ideas#update
#           DELETE /ideas/:id(.:format)      ideas#destroy
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy


