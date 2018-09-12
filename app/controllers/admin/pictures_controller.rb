class Admin::PicturesController < Admin::BaseController

  def index
    @pictures = Picture.all.order(id: :desc).page(params[:page]).per(10)
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    commit_attachment_ids = params[:commit_attachment_ids].present? ? params[:commit_attachment_ids].split(",") : []
    Attachment.where(id:commit_attachment_ids).update_all(attachment_entity_id:@picture.id)
    redirect_to :action=>"index" 
  end

  def show
    @picture = Picture.find(params[:id])
  end

  # 显示gps信息
  def show_gps
    require 'exifr/jpeg'
    @image = Attachment.find(params[:id])
    path = "#{Rails.root}/public#{@image.path.to_s}"
    exif = EXIFR::JPEG.new(path)
    @latitude = exif.gps&.latitude||39.9717219722
    @longitude = exif.gps&.longitude||116.4911780001
    redirect_to "http://www.gpsspg.com/maps.htm?maps=3&s=#{@latitude},#{@longitude}"
  end

  # 异步保存图片
  def upload_image
    new_attachment = Attachment.create({attachment_entity_type: "Picture", path: params[:draft_img], created_by: 1})
    had_attachment_ids = params[:had_attachment_ids].present? ? params[:had_attachment_ids].split(",") : []
    @had_attachment_ids = had_attachment_ids << new_attachment.id

    @new_images = Attachment.where(id:@had_attachment_ids)
    @attachment_ids = @had_attachment_ids.join(",")

    respond_to do |format|
      format.js  
    end
  end


  private

    def picture_params
      params.require(:picture).permit(:category_id,:name)
    end
end
