class RatingsController < ApplicationController

	before_action :require_login

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

	def destroy
		product = Product.find(params[:product_id])
		@rating = Rating.find(params[:id])
		@rating.destroy

		if @rating.save
      		redirect_to product, notice: 'Rating created!'
	    else
	    	redirect_to product, notice: 'Error! Please try again!'
	    end
	end

	private

	def require_login
		unless current_user
			flash[:error] = "You must be logged in to access this feature."
			redirect_to '/login'
		end
	end
end
