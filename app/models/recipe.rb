class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :reports
  belongs_to :user
end
