class Comment < ApplicationRecord
  belongs_to :article, optional: true
  belongs_to :picture, optional: true
  belongs_to :vendor, optional: true
end
