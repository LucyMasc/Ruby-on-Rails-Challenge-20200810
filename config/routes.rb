Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: proc { [200,{},['Ruby on Rails Challenge 20200810']] }

  scope module: :api do
    scope module: :v1 do
      resources :products
    end
  end
end
