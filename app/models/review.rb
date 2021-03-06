class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :rating, :description, :user_id, :product_id, presence: true
  validates :rating, numericality: {only_integer: true}
  validates :rating, inclusion: 1..5

  validates :user_id, :product_id, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
