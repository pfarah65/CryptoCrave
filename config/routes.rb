Rails.application.routes.draw do

  devise_for :authors
	root to: 'blog/posts#index'

	#/author/....
	namespace :authors do
		get '/account' => 'accounts#edit', as: :account
		put '/info' => 'accounts#update_info', as: :info
		put '/change_password' => 'accounts#change_password', as: :change_password
  		resources :posts do
  			put 'publish' => 'posts#publish', on: :member
  			put 'unpublish' => 'posts#unpublish', on: :member 
  		end
	end

	# does not expect author to go to these links
	scope module: 'blog' do
		get "about" => 'pages#about', as: :about
		get "contact" => 'pages#contact', as: :contact
		get "posts" => 'posts#index' , as: :posts
		get "posts/:id" => 'posts#show', as: :post
		#post "search" => 'posts#search', as: :search_posts
		get "search" => 'posts#search', as: :search_posts
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
