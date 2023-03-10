class PostsController < ApplicationController
    before_action :set_post, only: %i[ show edit update distroy ]

    # GET /posts
    def index
        @posts = Post.all
    end

    # GET /posts/1
    def show
    end

    # GET /posts/new
    def new
        @post = Post.new
    end

    # GET /posts/1/edit
    def edit
    end

    # POST /posts
    def create
        @post = Post.new(post_params)

        respond_to do |format|
            if @post.save
                flash[:notice] = "Your post was successfully created!"
                redirect_to posts_path(@post) 
            else
                render :new
            end
        end
    end

    # PATCH/PUT /posts/1
    def update
        respond_to do |format|
            if @post.update(post_params)
                redirect_to @post, notice: "Your post was successfully updated!"
            else
                render :edit
            end
        end
    end

    #DELETE /posts/1
    def destroy
        @post.destroy
        respond_to do |format|
            redirect_to posts_url, notice: "Your post was successfully deleted!"
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions
        def set_post
            @post = Post.find(params[:id])
        end

        # Only allow a list of trusted parameters through
        def post_params
            params.require(:post).permit(:title, :description)
        end
    end