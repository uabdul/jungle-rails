class Rating < ActiveRecord::Base

	has_one :user
	
	belongs_to :product
	belongs_to :user

	validates :product_id, presence: true
	validates :user_id, presence: true
	validates :rating, presence: true

end
