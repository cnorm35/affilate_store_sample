class AddAffiliateToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :affiliate, :string
  end
end
