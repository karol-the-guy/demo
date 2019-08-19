Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :line_items, param: :id, only: [:show]

      resources :offers, param: :id, only: [:show] do
        get 'accept_offer', on: :member
        get 'reject_offer', on: :member
      end
    end
  end
end
