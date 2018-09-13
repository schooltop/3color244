class PicturesController < ApplicationController
  layout 'article'

  def index
    @picture = Picture.last
  end

end
