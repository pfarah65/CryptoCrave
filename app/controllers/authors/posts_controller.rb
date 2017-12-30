module Authors
	class PostsController < AuthorController
	  before_action :set_post, only: [:show, :edit, :update, :destroy, :publish, :unpublish]

	  # GET /posts
	  # GET /posts.json
	  def index
	    @posts = current_author.posts.most_recent
	  end

	  # GET /posts/1
	  # GET /posts/1.json
	  def show
	  end

	  # GET /posts/new
	  def new
	    @post = current_author.posts.new
	  end
	  def publish
	  	@post.publish
	  	redirect_to authors_posts_url
	  	flash[:success]= "Post was successfully published."
	  end

	  def unpublish
		@post.unpublish
		redirect_to authors_posts_url
		flash[:danger]= "Post was successfully unpublished."
	  end

	  # GET /posts/1/edit
	  def edit
	  end

	  # POST /posts
	  # POST /posts.json
	  def create
	    @post = current_author.posts.new(post_params)
	    respond_to do |format|
	      if @post.save
	      	flash[:success]= "Post was successfully saved."
	        format.html { redirect_to authors_post_path(@post)}
	        format.json { render :show, status: :created, location: @post }
	      else
	        format.html { render :new }
	        format.json { render json: @post.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  # PATCH/PUT /posts/1
	  # PATCH/PUT /posts/1.json
	  def update
	    respond_to do |format|
	      if @post.update(post_params)
	      	@post.unpublish
			flash[:success]= "Post was successfully updated."
	        format.html { redirect_to authors_post_path(@post) }
	        format.json { render :show, status: :ok, location: @post }
	      else
	        format.html { render :edit }
	        format.json { render json: @post.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  # DELETE /posts/1
	  # DELETE /posts/1.json
	  def destroy
	  	@post.destroy
	  	flash[:danger]= "Post was deleted."
	    respond_to do |format|
	    	format.html { redirect_to authors_posts_url }
	    	format.json { head :no_content }
	    end
	  end

	  private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_post
	      @post = current_author.posts.friendly.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def post_params
	      params.require(:post).permit(:title, :body, :description, :banner_image_url, :tag_list)
	    end
	end

end