class Product < ApplicationRecord
  has_one_attached :image
  after_commit -> { broadcast_refresh_later_to "products" }
  validates :title, :description, :image, presence: true
  validates :title, length: { minimum: 10, too_short: "length must be at least 10 characters long"}
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validate :acceptable_image
  
  def acceptable_image
    return unless image.attached?

    acceptable_types = [ "image/gid", "image/jpeg", "image/png" ]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "must be GIF, JPG, or PNG image")
    end
  end
  validates :title, uniqueness: true
end
