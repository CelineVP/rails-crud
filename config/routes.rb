Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  root to: "lists#index" # cette route est la principale à l'ouverture du site
  resources :lists, except: [:edit, :update] do # faire toutes les routes de la list sauf edit et update
    resources :bookmarks, only: [:new, :create] # un user peut créer un nouveau bookmark en fonction de la list
  end
  resources :bookmarks, only: :destroy # un user peut suprimer un bookmark d'une list

end



# HTTP Verb	  Path	            Controller       #Action	Used for
# GET	        /photos	          photos         #index	display a list of all photos
# GET	        /photos/new	      photos         #new	return an HTML form for creating a new photo
# POST	      /photos	          photos         #create	create a new photo
# GET	        /photos/:id	      photos         #show	display a specific photo
# GET	        /photos/:id/edit	photos        #edit	return an HTML form for editing a photo
# PATCH/PUT	  /photos/:id	      photos        #update	update a specific photo
# DELETE	    /photos/:id	      photos       #destroy	delete a specific photo
