Rails.application.routes.draw do
  devise_for :users, skip: :all

  scope module: 'api', defaults: { format: :json } do
    namespace 'v1' do
      post 'registrations', to: 'registrations#create'
      post 'session', to: 'sessions#create'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
