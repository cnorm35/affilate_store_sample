class AddEtsyViewsToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :etsy_views, :integer
  end
end
