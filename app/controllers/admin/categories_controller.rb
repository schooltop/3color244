class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @q = SearchParams.new(params[:search_params] || {})
    @categories = Category.default_where(@q.attributes(self)).page(params[:page]).per(10)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  def show_name
    @category = Category.find(params[:id])
    render json: {name: @category.name}
  end
  
  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    @category.save
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    @category.update(category_params)
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to "index", notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:parent_id,:name)
    end
end
