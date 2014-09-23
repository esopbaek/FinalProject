MyApp::Application.routes.draw do
  resources :users, :only => [:create, :new, :show, :update, :edit]
  resource :dashboard, :only => [:show]
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

  resources :posts, only: [:create, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :comments, only: [:destroy] do
    resources :likes, only: [:create, :destroy]
  end

  resource :reports, only: [:show]

  root to: 'site#root'
  namespace :api, defaults: {format: :json} do
    resources :foods do
      collection do
        get 'search'
      end
    end

    resource :dashboard, :only => [:show]
    resources :posts, only: [:index, :create, :destroy, :show] do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:index, :create, :show, :destroy]
    end
    
    resources :measurements
    resources :logs, only: [:create, :destroy, :index]
    resources :diary_pages, only: [:create, :update, :edit, :show] do
    resources :food_entries, only: [:create, :new, :destroy]
    end

    resource :diet_profile, :only => [:create, :new, :show, :update, :edit, :index] do
      collection do
        get :summary
        get :goals
      end
    end
    
    resources :diary_pages, only: [:create, :update, :edit, :show] do
      resources :food_entries, only: [:create, :new, :destroy]
      member do
        get :breakfasts
        get :lunches
        get :dinners
        get :snacks
      end
    end

  end
end
