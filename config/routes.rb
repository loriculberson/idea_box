Rails.application.routes.draw do
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	post '/logout', to: 'sessions#destroy'
 
  resources :users do
 	 resources :ideas
 	end
end



#      Prefix Verb   URI Pattern                              Controller#Action
#          login GET    /login(.:format)                         sessions#new
#                POST   /login(.:format)                         sessions#create
#         logout POST   /logout(.:format)                        sessions#destroy
#     user_ideas GET    /users/:user_id/ideas(.:format)          ideas#index
#                POST   /users/:user_id/ideas(.:format)          ideas#create
#  new_user_idea GET    /users/:user_id/ideas/new(.:format)      ideas#new
# edit_user_idea GET    /users/:user_id/ideas/:id/edit(.:format) ideas#edit
#      user_idea GET    /users/:user_id/ideas/:id(.:format)      ideas#show
#                PATCH  /users/:user_id/ideas/:id(.:format)      ideas#update
#                PUT    /users/:user_id/ideas/:id(.:format)      ideas#update
#                DELETE /users/:user_id/ideas/:id(.:format)      ideas#destroy
#          users GET    /users(.:format)                         users#index
#                POST   /users(.:format)                         users#create
#       new_user GET    /users/new(.:format)                     users#new
#      edit_user GET    /users/:id/edit(.:format)                users#edit
#           user GET    /users/:id(.:format)                     users#show
#                PATCH  /users/:id(.:format)                     users#update
#                PUT    /users/:id(.:format)                     users#update
#                DELETE /users/:id(.:format)                     users#destroy