# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root 'messages#index'

  resources :messages do
    collection do
      get :unread_messages
    end
  end
  mount Ckeditor::Engine => '/ckeditor'
end
