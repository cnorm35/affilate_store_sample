class RenamePriceToListPrice < ActiveRecord::Migration
  def change
  	rename_column :products, :price, :list_price
  end
end
