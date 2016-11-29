Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "students#index"
  # Routes for the Cancellation_note resource:
  # CREATE
  get "/cancellation_notes/new", :controller => "cancellation_notes", :action => "new"
  post "/create_cancellation_note", :controller => "cancellation_notes", :action => "create"

  # READ
  get "/cancellation_notes", :controller => "cancellation_notes", :action => "index"
  get "/cancellation_notes/:id", :controller => "cancellation_notes", :action => "show"

  # UPDATE
  get "/cancellation_notes/:id/edit", :controller => "cancellation_notes", :action => "edit"
  post "/update_cancellation_note/:id", :controller => "cancellation_notes", :action => "update"

  # DELETE
  get "/delete_cancellation_note/:id", :controller => "cancellation_notes", :action => "destroy"
  #------------------------------

  # Routes for the Lesson resource:
  # CREATE
  get "/lessons/new/:id", :controller => "lessons", :action => "new"
  post "/create_lesson", :controller => "lessons", :action => "create"

  # READ
  get "/lessons", :controller => "lessons", :action => "index"
  get "/lessons/:id", :controller => "lessons", :action => "show"

  # UPDATE
  get "/lessons/:id/edit", :controller => "lessons", :action => "edit"
  post "/update_lesson/:id", :controller => "lessons", :action => "update"

  # DELETE
  get "/delete_lesson/:id", :controller => "lessons", :action => "destroy"
  #------------------------------

  # Routes for the Break resource:
  # CREATE
  get "/breaks/new", :controller => "breaks", :action => "new"
  post "/create_break", :controller => "breaks", :action => "create"

  # READ
  get "/breaks", :controller => "breaks", :action => "index"
  get "/breaks/:id", :controller => "breaks", :action => "show"

  # UPDATE
  get "/breaks/:id/edit", :controller => "breaks", :action => "edit"
  post "/update_break/:id", :controller => "breaks", :action => "update"

  # DELETE
  get "/delete_break/:id", :controller => "breaks", :action => "destroy"
  #------------------------------

  # Routes for the Schedule_adjustment resource:
  # CREATE
  get "/schedule_adjustments/new", :controller => "schedule_adjustments", :action => "new"
  post "/create_schedule_adjustment", :controller => "schedule_adjustments", :action => "create"

  # READ
  get "/schedule_adjustments", :controller => "schedule_adjustments", :action => "index"
  get "/schedule_adjustments/:id", :controller => "schedule_adjustments", :action => "show"

  # UPDATE
  get "/schedule_adjustments/:id/edit", :controller => "schedule_adjustments", :action => "edit"
  post "/update_schedule_adjustment/:id", :controller => "schedule_adjustments", :action => "update"

  # DELETE
  get "/delete_schedule_adjustment/:id", :controller => "schedule_adjustments", :action => "destroy"
  #------------------------------

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
