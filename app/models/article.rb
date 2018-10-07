class Article < ApplicationRecord
  has_many :attachments, as: :attachment_entity
  belongs_to :category, optional: true
  belongs_to :user
  belongs_to :vendor
  has_many :comments
  serialize :tag

	def user_name
    "@#{self.user&.name}"
	end

	def self.view_count_top
    order(view_count: :desc).limit(10)
	end

	def cover_img_path
    return self.cover_img if self.activity_id == 1
  	self.cover_img ? Attachment.find(self.cover_img.to_i).path.url : "/assets/f10.jpg"
  end

  def mpt
    self.mp3 ? Attachment.find(self.mp3).path.url : ""
  end

end
