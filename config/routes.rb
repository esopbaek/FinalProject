MyApp::Application.routes.draw do
  resources :users, :only => [:create, :new, :show, :update, :edit] do
    collection do
      get :dashboard
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
  end
  resources :logs, only: [:create, :destroy, :index]
  resources :diary_pages, only: [:create, :update, :edit, :show] do
    resources :food_entries, only: [:create, :new, :destroy]
  end
  
  resources :exercise_diary_pages, only: [:create, :update, :edit, :show] do
    resources :exercise_entries, only: [:create, :new, :destroy]
  end

  root to: 'sessions#new'
end
