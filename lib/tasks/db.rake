namespace :db do
  desc "TODO"
  task data_clean: :environment do
  	Product.remove_etsy_duplicates
  	Product.remove_amazon_duplicates
  	Product.convert_etsy_price
  	Product.remove_blank_amazon_price
  end

end
