require 'amazon/ecs'

namespace :amazon_import do
  desc "TODO"
  task apparel: :environment do
  	  5.times do |i|
  		  	response = Amazon::Ecs.item_search('Star Wars', { :response_group => 'Large',
  		  																												:search_index => 'Apparel',
  		  																												:item_page => i + 1
  		  																												 })
  		  	response.items.each do |item|
  		  		product = Product.amazon_apparel_import(item)
  		  		product.category = "Apparel"
  		  		product.save
  		  	end
  		  end
  end

    desc "TODO"
    task toys: :environment do
      10.times do |i|
        response = Amazon::Ecs.item_search('Star Wars', { :response_group => 'Large',
                                                              :search_index => 'Toys',
                                                              :item_page => i + 1
                                                               })
          response.items.each do |item|
            product = Product.amazon_import(item)
            product.category = "Toys"
            product.save
          end

        end
    end

  desc "TODO"
  task most_popular: :environment do
  	  2.times do |i|
  		  	response = Amazon::Ecs.item_search('Star Wars', { :response_group => 'Large',
  		  																												:search_index => 'All',
  		  																												:item_page => i + 1
  		  																												 })
  		  	response.items.each do |item|
  		  		product = Product.amazon_import(item)
  		  		product.category = "Most Popular"
  		  		product.save
  		  	end
  		  end
  end

end
