class Article < ApplicationRecord
  has_many :attachments, as: :attachment_entity
  belongs_to :category, optional: true
  has_many :comments
  serialize :tag

	def user_name
    "@#{self.title}"
	end

	def self.view_count_top
    order(view_count: :desc).limit(5)
	end

	def cover_img_path
  	self.cover_img ? Attachment.find(self.cover_img.to_i).path.url : "/assets/f10.jpg"
  end

  def mpt
    self.mp3 ? Attachment.find(self.mp3).path.url : ""
  end

end
