MyApp::Application.routes.draw do
  resources :users, :only => [:create, :new, :show, :update, :edit] do
    collection do
      get :dashboard
      get :diary
    end
  end
  resource :session, :only => [:create, :destroy, :new]
  resource :diet_profile, :only => [:create, :new, :show, :update, :edit] do
    collection do
      get :summary
      get :goals
    end
  end
  resources :foods
  resources :measurements

  root to: 'sessions#new'
end
