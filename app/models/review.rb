class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :description, presence: true
  validates :product_id, presence: true 
  validates :user_id, presence: true 
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
