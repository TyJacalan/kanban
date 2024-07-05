# frozen_string_literal: true

Rails.application.routes.draw do
  root 'kanbans#index'

  patch '/kanbans/:id/sort', to: 'kanbans#sort', as: 'kanban_sort'
  resources :kanbans do
    resources :kanban_columns, except: %i[index show] do
      resources :cards, except: %i[index]
    end
  end
end
