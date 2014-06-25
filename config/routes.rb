MyApp::Application.routes.draw do
  resources :users, :only => [:create, :new, :show, :update, :edit]
  resource :session, :only => [:create, :destroy, :new]
  resource :diet_profile, :only => [:create, :new, :show, :update, :edit] do
    collection do
      get :summary
      get :goals
    end
  end
  root to: 'users#dashboard'
end
