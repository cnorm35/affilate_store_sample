class AddFinalPriceToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :final_price, :string
  end
end
