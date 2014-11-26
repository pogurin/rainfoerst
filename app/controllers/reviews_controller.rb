class ReviewsController < ApplicationController
	before_filter :load_product
	before_filter :ensure_logged_in, only: [:create, :destroy]



	def index
		@reviews = Review.all
	end

	def show
		@review = Review.find(params[:id])
	end

	def create
		@review = @product.reviews.build(review_params)
		@review.user = current_user

		respond_to do |format|
			if @review.save 
				format.html { redirect_to product_path(@product.id), notice: 'Review added.'}
				format.js{} 
			else
				format.html { render 'product/show', alert: 'There was an error.'}
				format.js{}
			end
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
	end

	def edit
		@review =  Review.find(params[:id])
	end

	def update
		@review = Review.find(params[:id])

		if @review.update_attributes(review_params)
			redirect_to product_path(@product) 
			# To defin the specific product 
		else
			render :edit
		end
	end

	private

	def review_params
		params.require(:review).permit(:comment, :product_id)
	end

	def load_product
		@product = Product.find(params[:product_id])
	end
end