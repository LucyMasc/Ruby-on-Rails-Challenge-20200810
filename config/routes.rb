Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: proc { [200,{},['Ruby on Rails Challenge 20200810']] }
end
