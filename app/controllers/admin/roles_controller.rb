class Admin::RolesController < Admin::BaseController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  # GET /roles
  # GET /roles.json
  def index
    @q = SearchParams.new(params[:search_params] || {})
    @roles = Role.default_where(@q.attributes(self)).page(params[:page]).per(10)
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  def show_name
    @role = Role.find(params[:id])
    render json: {name: @role.name}
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)
    @role.save
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json

  def add_permissions
    @role = Role.find(params[:id])
  end

  def save_permissions
    @role = Role.find(params[:id])
    @role.permission_ids = params[:role][:permission_ids]
  end
	
  def add_employees
    @role = Role.find(params[:id])
  end

  def save_employees
    @role = Role.find(params[:id])
    @role.employee_ids = params[:role][:employee_ids]
  end

  def update
    @role.update(role_params)
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to "index", notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:parent_id,:name)
    end
end
