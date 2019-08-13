class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end


Rails.application.routes.draw do
  
  get 'users/index'
  constraints(SubdomainPresent) do
    authenticate :user do
      mount ActionCable.server => '/cable'
    end
  
    root 'schools#index'
    get 'schools/setup'
    get "/schools/notifications", to: "schools#notifications"
    get "/schools/posts", to: "schools#global_chats" 
    namespace :schools do
      resources :organization_informations, only: [:create]
      post "update_organization_files", to: "organization_informations#update_organization_files"
      namespace :courses do
        get "course_edit"
        post "update_course_files"
        get 'enroll_course'
        get 'clone_course'
        get 'download_file'
        get 'enroll_students'
      end
      resources :courses do
        get 'documents'
        get 'gradebooks'
      end
      
      namespace :lessons do
        post 'create_video'
        post 'create_quiz'
        post 'create_reading'
        post 'create_essay'
        post 'create_page'
        post 'create_writing'
        post 'create_document'
        post 'create_presentation'
        post 'create_audio'
        post 'create_discussion'
        post 'update_template'
        post 'client_subscription'
        post 'launch'
        get 'lesson_update'
        get 'edit_activity'
        put "update_activities"
        post "position_update"
        post 'update_video'
        post 'update_quiz'
        post 'update_reading'
        post 'update_essay'
        post 'update_page'
        post 'update_writing'
        post 'update_document'
        post 'update_presentation'
        post 'update_audio'
        post 'update_discussion'
      end
      resources :lessons do
        collection do
          post "create_grade"
        end
      end
      resources :marketings, only: [:index]
      put 'update_marketing', to: "marketings#update_marketing", as: :update_marketing
      resources :posts, only: [:create] do
        get 'like'
      end
      resources :announcements
      get 'archive_announcement/:id' => "announcements#archive_announcement", as: :archive_announcement
      # mailbox folder routes
      get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
      get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
      get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash
      # conversations
      resources :conversations do
        member do
          post :reply
          post :trash
          post :untrash
        end
      end
      resources :enroll_course_rooms do
        resources :enroll_course_messages
      end
      namespace :enroll_course_messages do
        get 'like'
      end
      get "sort_announcements", to: "announcements#sort_announcements"
      get 'correction/:activity_id/:type/:user_id', to: "courses#correction", as: :course_correction
      get 'gradebooks', to: "courses#all_gradebooks"
    end
    resources :event_attendee_groups, except: [:show]
    get 'search_users', to: "users#search_users", as: :search_users
    put "/update_role", to: "users#update_role", as: :update_role
    resources :users, only: [:index]
    post "new_user", to: "users#new_user", as: :new_user
    get "users/user_active/:token", to: "users#user_active", as: :user_active
    get "export_users/:type", to: "users#export_users", as: :export_users
    post "import_users", to: "users#import_users", as: :import_users
    get "sort_users", to: "users#sort_users"
    get "active_deactive_users", to: "users#active_deactive_users"
    
    resources :events
    get '/course/:id', to: "events#course", as: :event_course
    get '/lesson/:id', to: "events#lesson", as: :event_lesson
    get '/video_activity/:id', to: "events#video_activity", as: :video_activity
    get '/audio_activity/:id', to: "events#audio_activity", as: :audio_activity
    get '/writing_activity/:id', to: "events#writing_activity", as: :writing_activity
    get '/quiz_activity/:id', to: "events#quiz_activity", as: :quiz_activity
    get '/event/:id/:notify_id', to: "events#event_show", as: :event_show

    get '/event/:id', to: "events#event", as: :show_event
    get '/self_event', to: "events#self_event"
    get 'course_enrolled_users', to: "event_attendee_groups#course_enrolled_users"
    resources :chat_rooms, only: [:new, :create, :show, :index]
    resources :charges, only: [:create] do
      collection do
        post :update_subscription
        post :upcoming_invoice
      end
    end
    resources :announcements
    resources :calendars
    resources :live_conversations do
      resources :live_messages
    end
    get '/user_search', to: "coursesusers#user_search", as: :user_search

    namespace :students do
      resources :courses
      get '/courses/lesson_details/:lesson_id', to: "courses#lesson_details", as: :lesson_details
      resources :lessons
      get '/lessons/:id/show_activity/:activity_id', to: "lessons#show_activity", as: :show_activity
      get '/lessons/:id/quiz_activities/:activity_id', to: "lessons#quiz_activities", as: :quiz_activities
      post '/lessons/create_student_answers'
    end
    get 'students/update_rating', to: "students/courses#update_rating"
  end
  constraints(SubdomainBlank) do
    root 'dashboard#index'
     get '/signup' , to: 'dashboard#signup'
    get '/login', to: 'dashboard#login'
    get '/forgot_password', to: 'dashboard#forgot_password'
    resources :clients, only: [:new, :create]
  end
  # devise_for :users, controllers: {sessions: 'users/sessions'}
  devise_for :users, controllers: {
        sessions: 'users/sessions', passwords: 'users/passwords',  confirmations: 'users/confirmations', registrations: 'users/registrations'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
