class Admin::VendorsController < Admin::BaseController
  before_action :set_vendor, only: [:show, :edit, :update]

	def index
   	 @q = SearchParams.new(params[:search_params] || {})
   	 @vendors = Vendor.default_where(@q.attributes(self)).page(params[:page]).per(10)
  	end

  	def new
   	  @vendor = Vendor.new
    end

    def edit
     @html_title = "Edit vendor"
     render :layout => false
    end

    def show
      @html_title =  "Show vendor"
      render :layout => false
    end


    def create
      @vendor = Vendor.new(vendor_params)
      @vendor.save
    end

    def update
      @vendor.update(vendor_params)
    end

    def show_name
      @vendor = Vendor.find(params[:id])
      render json: {name: @vendor.name}
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_params
      params.require(:vendor).permit(:employee_id,:parent_id,:bd_id,:am_id,:cs_id,:category_id,:parent_name,:name,:content,:cover_img,:log_img,:mobile,:office_tel,:address,:email,:website,:gps,:city,:place,:discount,:tag,:view_count,:seq)
    end

end