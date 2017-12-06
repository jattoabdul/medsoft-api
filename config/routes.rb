Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users
      post 'auth/login', to: 'users#login'
      resources :drugs
      resources :sales
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
