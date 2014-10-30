Criduino::Application.routes.draw do
  scope ":locale", :locale => /en|pt\-BR/ do
    resources :users
	
	resource :user_confirmation, :only => [:show]
  end
  
  root :to => "home#index"
end
