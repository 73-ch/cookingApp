class Report < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :recipe
  belongs_to :user
end
