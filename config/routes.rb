MyApp::Application.routes.draw do
  resources :users, :only => [:create, :new, :show, :update, :edit] do
    collection do
      get :dashboard
      get :diary
    end
  end
  resource :session, :only => [:create, :destroy, :new]
  resource :social_profile, :only => [:show, :update, :edit]
  resource :diet_profile, :only => [:create, :new, :show, :update, :edit] do
    collection do
      get :summary
      get :goals
    end
  end
  resources :foods
  resources :measurements do
    collection do
      get :all
    end
  end
  resources :logs, only: [:create, :destroy, :index]


  root to: 'sessions#new'
end
