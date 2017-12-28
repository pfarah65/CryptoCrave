module Blog
	class PostsController < BlogController
	  # GET /posts
	  # GET /posts.json
	  MAX_AMOUNT=9
	  def index
	  	if params[:tag].present?
	  		@posts = Post.most_recent.published.tagged_with(params[:tag]).paginate(:page => params[:page], per_page:MAX_AMOUNT)
	  	else
	    	@posts = Post.most_recent.published.paginate(:page => params[:page], per_page:9)
	  	end
	  end

	  # GET /posts/1
	  # GET /posts/1.json
	  def show
	      @post = Post.published.friendly.find(params[:id])
	  end

	end

end