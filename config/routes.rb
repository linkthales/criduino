Criduino::Application.routes.draw do
  LOCALES = /en|pt\-BR/

  scope "(:locale)", :locale => LOCALES do
	resources :arduinos
  
	resources :users
		
	resource :confirmation, :only => [:show]
		
	resource :user_sessions, :only => [:create, :new, :destroy]
  end

  get "arduinos/:id/leitura" => "arduinos#leitura"
  get "arduinos/:id/escrita" => "arduinos#escrita"

  match '/:locale' => 'home#index', :locale => LOCALES
  root :to => "home#index"
end
