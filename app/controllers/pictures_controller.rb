class PicturesController < ApplicationController
  layout 'article'

  def index
    @picture = Picture.last
  end

  def show
    @picture = Picture.find(params[:id])
  end

end
