class Admin::CommentsController < Admin::BaseController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
   # @comments = Comment.all
    @q = SearchParams.new(params[:search_params] || {})
    @comments = Comment.default_where(@q.attributes(self)).page(params[:page]).per(10)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end
  

  def show_name
    @blog = Blog.find(params[:id])
    render json: {name: @blog.title}
  end
  

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.save
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
     @comment.update(comment_params)
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:blog_id,:content)
    end
end
