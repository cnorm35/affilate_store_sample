class PagesController < ApplicationController
  def home
  	@products = Product.all.paginate(page: params[:page], per_page: 20).order('random ()')
  	@subscription = Subscription.new
  end

  def about 
  end

  def test
  	@products = Product.all.paginate(page: params[:page], per_page: 20).order('random ()')
  end
  
end
