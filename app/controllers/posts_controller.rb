class PostsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]


  before_action :set_post, only: [ :edit, :update, :destroy, :vote]
  layout "xone", only:[:index]

  # GET /posts
  # GET /posts.json
  def index

    if params[:search].present?
      @posts = Post.near(params[:search], 150)
    else
      @posts = Post.all

    end
     @posts= @posts.where(:is_approved=>true)
  end
  
  def old

    if params[:search].present?
      @posts = Post.near(params[:search], 150)
    else
      @posts = Post.all

    end
     @posts= @posts.where(:is_approved=>true)
  end


  def pending_page
      @posts = Post.where(:is_approved=>false)
  end



  def my_project
   @user = User.find(current_user.id)
    @posts = @user.posts
  end

  def inbox
    @messages = current_user.received_messages
      @users=User.all
   @users -= [current_user]

  end

  def pricing
  end



  # GET /posts/1
  # GET /posts/1.json
  def show
      @post = Post.friendly.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create

    @post = Post.new(post_params)
    @post.user = current_user

       respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end


  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end


  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @post.vote_by voter: current_user, vote: direction

    redirect_to action: :index
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(
      :body, :topic, :project_name, :quick_pitch, :coverimage, :logoimage, :full_pitch, :skills,
      :youtube_id, :to_the_table, :compensation_method, :location, :url, :content,
      :name, :tag_list,:category,:latitude,:longitude, :is_approved, :redirect_url
      )
  end

end
