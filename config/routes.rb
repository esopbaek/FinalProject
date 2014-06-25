MyApp::Application.routes.draw do
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :destroy, :new]
  resource :diet_profile, :only => [:create, :new] do
    collection do
      get :summary
      get :goals
    end
  end
  root to: 'users#dashboard'
end
