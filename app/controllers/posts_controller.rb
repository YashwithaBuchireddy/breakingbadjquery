class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # renders index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: "Post was successfully created." }
        format.json { render json: { success: true, post: @post } }
        format.js   # create.js.erb for UJS
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: { success: false, errors: @post.errors.full_messages }, status: :unprocessable_entity }
        format.js   # create.js.erb for UJS errors
      end
    end
  end


  # PATCH/PUT /posts/1
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render json: { success: true, post: @post } }
        format.js   # update.js.erb for UJS
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: { success: false, errors: @post.errors.full_messages }, status: :unprocessable_entity }
        format.js   # update.js.erb for UJS errors
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { render json: { success: true } }
      format.js   # destroy.js.erb for UJS
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
