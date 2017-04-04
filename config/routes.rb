Rails.application.routes.draw do

  devise_for :users, :only => [:sessions, :registrations]
  root to: 'application#index'
  get '/exam', to: 'exam#index'
  get '/exam/:n', to: 'exam#index', as: :examwithlevel

  namespace :admin do
    get '/', to: 'admin#index'
    resources :question, :only => [:index, :new, :create, :edit, :update]
    post '/questiondelete/:id', to: 'question#destroy', as: :question_delete
  end

end