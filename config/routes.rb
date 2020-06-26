Rails.application.routes.draw do
  resources :tweets
  devise_for :users
  root 'pages#home'
  resources :turmas do 
  	collection do
  		post :add_aluno
  		post :add_attributes
  	end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
