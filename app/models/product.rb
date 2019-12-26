class Product < ApplicationRecord
	has_many :reviews, dependent: :destroy 
	has_one_attached :image, dependent: :destroy 
	validates :title, presence: true, length: {minimum: 5, maximum: 255}
	validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
	validates :description, presence: true
	validates :image, presence: true
end
