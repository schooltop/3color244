class Admin::PermissionsController < Admin::BaseController
  before_action :set_permission, only: [:show, :edit, :update, :destroy]

  # GET /permissions
  # GET /permissions.json
  def index
    @q = SearchParams.new(params[:search_params] || {})
    @permissions = Permission.default_where(@q.attributes(self)).page(params[:page]).per(10)
  end

  # GET /permissions/1
  # GET /permissions/1.json
  def show
  end
 def show_name
    @permission = permission.find(params[:id])
    render json: {name: @permission.name}
  end
  # GET /permissions/new
  def new
    @permission = permission.new
  end
  def add_roles
    @permission = Permission.find(params[:id])
  end

  def save_roles
    @permission = Permission.find(params[:id])
    @permission.role_ids = params[:permission][:role_ids]
  end
  
  # GET /permissions/1/edit
  def edit
  end

  # POST /permissions
  # POST /permissions.json
  def create
    @permission = permission.new(permission_params)
    @permission.save
  end

  # PATCH/PUT /permissions/1
  # PATCH/PUT /permissions/1.json
  def update
    @permission.update(permission_params)
  end

  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    @permission.destroy
    respond_to do |format|
      format.html { redirect_to "index", notice: 'permission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission
      @permission = permission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permission_params
      params.require(:permission).permit(:parent_id,:name)
    end
end
