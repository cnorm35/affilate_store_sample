class Product < ActiveRecord::Base

	def to_dollars(price)
		price.to_f / 100
	end

	def percent_off
		if list_price.present?
			(to_dollars(list_price) - to_dollars(final_price)) / to_dollars(list_price) * 100
		end
	end

	def on_sale?
		list_price.to_i > final_price.to_i
	end


	def self.amazon_import(item)
		Product.new(
			:name => item.get('ItemAttributes/Title'),
			:affiliate => "Amazon",
			:affiliate_url => item.get('DetailPageURL'),
			:image_url => item.get('LargeImage/URL'),
			:list_price => item.get('ItemAttributes/ListPrice/Amount'),
			:final_price => item.get('OfferSummary/LowestNewPrice/Amount'),
			:amazon_id => item.get('ASIN')
			)
	end

	def self.amazon_apparel_import(item)
		Product.new(
			:name => item.get('ItemAttributes/Title'),
			:affiliate => "Amazon",
			:affiliate_url => item.get('DetailPageURL'),
			:image_url => item.get('LargeImage/URL'),
			:list_price => item.get('ItemAttributes/ListPrice/Amount'),
			:final_price => item.get('ItemAttributes/ListPrice/Amount'),
			:amazon_id => item.get('ASIN')
			)
	end

	def self.remove_etsy_duplicates
		group = all.group_by{ |product| product.etsy_listing_id }
		group.values.each do |dups|
			first_one = dups.shift
			dups.each { |dup| dup.destroy unless dup.etsy_listing_id.nil? }
		end
	end

	def self.remove_amazon_duplicates
		group = all.group_by{ |product| product.amazon_id }
		group.values.each do |dups|
			first_one = dups.shift
			dups.each { |dup| dup.destroy unless dup.amazon_id.nil? }
		end
	end

	def self.convert_etsy_price
		products = where(affiliate: "Etsy")
		products.each do |prod|
			initial = prod.final_price.to_i
			converted = initial * 100
			prod.final_price = converted.to_s
			prod.save
		end
	end

	def self.remove_blank_amazon_price
		products = where(affiliate: "Amazon")
		products.each do |prod|
			prod.delete if prod.final_price.nil?
		end
	end

end
