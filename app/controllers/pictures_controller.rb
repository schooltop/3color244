class PicturesController < ApplicationController
  layout 'blog'

  def index
    @picture = Picture.last
  end

end
