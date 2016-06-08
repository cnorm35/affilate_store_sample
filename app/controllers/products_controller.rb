class ProductsController < ApplicationController
	before_action :set_product, except: [:most_popular, :toys, :apparel, :new, :create, :accessories, :home_goods]
	before_action :authenticate_user!, except: [:most_popular, :toys, :apparel, :accessories, :home_goods]

	def most_popular
		@products = Product.where(
													category: 'Most Popular').
													paginate(page: params[:page], per_page: 20).
													order('random ()')
	end

	def toys
		@products = Product.where(
													category: 'Toys').
													paginate(page: params[:page], per_page: 20)
	end

	def apparel
		@products = Product.where(
													category: 'Apparel').
													paginate(page: params[:page], per_page: 20).
													order('random ()')
	end

	def accessories
		@products = Product.where(
													category: 'Accessories').
													order('etsy_views DESC').
													paginate(page: params[:page], per_page: 20)
	end

	def home_goods
		@products = Product.where(category: 'Home').
															order('etsy_views DESC').
															paginate(page: params[:page], per_page: 20)
	end

	def new
		@product = Product.new
	end

	def edit 
	end

	def update
		if @product.update_attributes(product_params)
			redirect_to "/"
			flash[:success] = "Updated product"
		else
			flash[:danger] = "Unable to update"
		end
	end

	def create
		@product = Product.new(product_params)

		if @product.save
			flash[:success] = "Product added"
			redirect_to root_path
		else
			flash[:danger] = "Unable to create product"
			redirect_to root_path
		end
	end

	def destroy
		@product.destroy
		flash[:success] = "Product Successfully Removed"
		redirect_to root_path
	end

	private

		def set_product
			@product = Product.find(params[:id])
		end

		def product_params
			params.require(:product).permit(:name, :affiliate, :affiliate_url, :list_price, :final_price,
																			:category, :image_url)
		end


end