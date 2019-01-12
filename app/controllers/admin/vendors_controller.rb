class Admin::VendorsController < Admin::BaseController
  before_action :set_vendor, only: [:show, :edit, :update]
  require 'exifr/jpeg'

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
      respond_to do |format|
        if @vendor.save
          unless params[:log_img].blank?
            attachment = Attachment.create(attachment_entity_type: "Vendor",attachment_entity_id: @vendor.id , path: params[:log_img], created_by: 1 ) 
            @vendor.log_img = attachment.id.to_s
          end
          unless params[:cover_img].blank?
            attachment = Attachment.create(attachment_entity_type: "Vendor",attachment_entity_id: @vendor.id , path: params[:draft_img], created_by: 1 ) 
            @vendor.cover_img = attachment.id.to_s
            path = "#{Rails.root}/public#{attachment.path.to_s}"
            exif = EXIFR::JPEG.new(path)
            @latitude = exif.gps&.latitude||39.9717219722
            @longitude = exif.gps&.longitude||116.4911780001
            @vendor.latitude = @latitude
            @vendor.longitude = @longitude
            @vendor.save
          end
          format.html { redirect_to @vendor, notice: 'vendor was successfully created.' }
          format.json { render :show, status: :created, location: @vendor }
        else
          format.html { render :new }
          format.json { render json: @vendor.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /vendors/1
    # PATCH/PUT /vendors/1.json
    def update
      respond_to do |format|
        if @vendor.update(vendor_params)
          unless params[:log_img].blank?
            attachment = Attachment.create(attachment_entity_type: "Vendor",attachment_entity_id: @vendor.id , path: params[:log_img], created_by: 1 ) 
            @vendor.log_img = attachment.id.to_s
          end
          unless params[:cover_img].blank?
            attachment = Attachment.create(attachment_entity_type: "Vendor",attachment_entity_id: @vendor.id , path: params[:cover_img], created_by: 1 ) 
            @vendor.cover_img = attachment.id.to_s
            path = "#{Rails.root}/public#{attachment.path.to_s}"
            exif = EXIFR::JPEG.new(path)
            @latitude = exif.gps&.latitude||39.9717219722
            @longitude = exif.gps&.longitude||116.4911780001
            @vendor.latitude = @latitude
            @vendor.longitude = @longitude
            @vendor.save
          end
          format.html { redirect_to @vendor, notice: 'vendor was successfully updated.' }
          format.json { render :show, status: :ok, location: @vendor }
        else
          format.html { render :edit }
          format.json { render json: @vendor.errors, status: :unprocessable_entity }
        end
      end
    end

    def upload_image
      attachment = Attachment.create(attachment_entity_type: "vendor", path: params[:wang_editor_file], created_by: 1 )
      render plain: attachment.path
    end

    # 显示gps信息
    def show_gps
      @image = Attachment.find(params[:id])
      path = "#{Rails.root}/public#{@image.path.to_s}"
      exif = EXIFR::JPEG.new(path)
      @latitude = exif.gps&.latitude||39.9717219722
      @longitude = exif.gps&.longitude||116.4911780001
      redirect_to "http://www.gpsspg.com/maps.htm?maps=3&s=#{@latitude},#{@longitude}"
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_params
      params.require(:vendor).permit(:employee_id,:parent_id,:bd_id,:am_id,:cs_id,:category_id,:parent_name,:name,:content,:mobile,:office_tel,:address,:email,:website,:gps,:city,:place,:discount,:tag,:view_count,:seq)
    end

end