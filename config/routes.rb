Rails.application.routes.draw do
  # Routes for the Trainer resource:
  # CREATE
  get "/trainers/new", :controller => "trainers", :action => "new"
  post "/create_trainer", :controller => "trainers", :action => "create"

  # READ
  get "/trainers", :controller => "trainers", :action => "index"
  get "/trainers/:id", :controller => "trainers", :action => "show"

  # UPDATE
  get "/trainers/:id/edit", :controller => "trainers", :action => "edit"
  post "/update_trainer/:id", :controller => "trainers", :action => "update"

  # DELETE
  get "/delete_trainer/:id", :controller => "trainers", :action => "destroy"
  #------------------------------

  # Routes for the Student resource:
  # CREATE
  get "/students/new", :controller => "students", :action => "new"
  post "/create_student", :controller => "students", :action => "create"

  # READ
  get "/students", :controller => "students", :action => "index"
  get "/students/:id", :controller => "students", :action => "show"

  # UPDATE
  get "/students/:id/edit", :controller => "students", :action => "edit"
  post "/update_student/:id", :controller => "students", :action => "update"

  # DELETE
  get "/delete_student/:id", :controller => "students", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
