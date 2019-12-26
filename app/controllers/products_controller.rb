class ProductsController < ApplicationController
	before_action :require_login, except: [:index, :show]

	def index
		@product_list = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		# render plain: params[:product].inspect
		@product = Product.new(product_params)

		if(@product.save)
			redirect_to @product
		else
			render 'new'
		end
	end

	def update
		@product = Product.find(params[:id])

		if(@product.update(product_params))
			redirect_to @product
		else
			render 'edit'
		end
	end

	def destroy
		@product = Product.find(params[:id])

		@product.destroy
		redirect_to products_path
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	private def product_params
		params.require(:product).permit(:title, :description, :image, :price)
	end
end
