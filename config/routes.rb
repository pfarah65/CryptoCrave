Rails.application.routes.draw do

  devise_for :authors
	root to: 'blog/posts#index'

	#/author/....
	namespace :authors do
  		resources :posts
	end

	# does not expect author to go to these links
	scope module: 'blog' do
		get "about" => 'pages#about', as: :about
		get "contact" => 'pages#contact', as: :contact
		get "posts" => 'posts#index' , as: :posts
		get "posts/:id" => 'posts#show', as: :post
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
