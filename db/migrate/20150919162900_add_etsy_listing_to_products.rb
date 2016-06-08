class AddEtsyListingToProducts < ActiveRecord::Migration
  def change
    add_column :products, :etsy_listing_id, :string
  end
end
