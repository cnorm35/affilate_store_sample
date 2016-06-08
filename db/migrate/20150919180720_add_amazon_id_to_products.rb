class AddAmazonIdToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :amazon_id, :string
  end
end
