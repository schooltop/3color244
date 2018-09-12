class Picture < ApplicationRecord
  belongs_to :category, optional: true	
  has_many :attachments, as: :attachment_entity
  serialize :tag
end
