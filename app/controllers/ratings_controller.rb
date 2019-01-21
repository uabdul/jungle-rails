class RatingsController < ApplicationController

	def create
		product = Product.find(params[:product_id])
		@rating = Rating.create({
			product_id: product.id,
			user_id: current_user.id,
			description: params[:rating][:description],
			rating: params[:rating][:rating]
		})
		@rating.save

		if @rating.save
      		redirect_to product, notice: 'Rating created!'
	    else
	    	redirect_to product, notice: 'Error! Please try again!'
	    end
	end

end
