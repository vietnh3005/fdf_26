class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :discount_products, dependent: :destroy
  has_many :discounts, through: :discount_products
  has_many :order_details

  belongs_to :category, required: false
  before_destroy :check_empty

  validates :name, presence: true,length: {maximum: 100}
  validates :price, presence: true
  validates :category, presence: true
  validates :classify, presence: true

  enum classify_types: [:Food, :Drink]
end
