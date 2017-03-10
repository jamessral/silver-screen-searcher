Rails.application.routes.draw do
  devise_for :users, skip: :all

  scope module: 'api', defaults: { format: :json } do
    namespace 'v1' do
      post 'registrations', to: 'registrations#create'
      post 'session', to: 'sessions#create'
    end
  end
end
