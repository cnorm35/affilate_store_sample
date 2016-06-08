require 'open-uri'
require 'json'

namespace :etsy_import do
  desc "TODO"
  task accessories: :environment do
  	#gets first 100 resuts with images first page of results
  	# full url


  	#changed url to pull 25 items for testing
  	polling_url = "https://openapi.etsy.com/v2/listings/active?keywords=%22Star%20Wars%22&category=69150467&sort_on=score&limit=100&offset=0&includes=Images&api_key=fwd71s4qmujglvjf3nh6oj0k"
  
  	# Prepare API request
    uri = URI.parse(polling_url)

    # Submit request
    response = JSON.parse(open(uri).read)

    items =  response["results"]

    etsy_affiliate_base_url = "http://www.awin1.com/cread.php?s=520379&amp;v=6220&amp;q=253771&amp;r=249711&amp;p="

    #{}"#{etsy_affiliate_base_url}#{item['url']}"

    items.each do |item|
    	product = Product.create(
    			name: item['title'],
    			affiliate_url: "#{etsy_affiliate_base_url}#{item['url']}",
    			image_url: item["Images"][0]['url_570xN'],
    			category: "Accessories",
    			final_price: item['price'],
          etsy_views: item['views'].to_i,
    			affiliate: "Etsy",
          etsy_listing_id: item['listing_id']
    		)
    end

  end

  task jewlery: :environment do
      polling_url = "https://openapi.etsy.com/v2/listings/active?keywords=%22Star%20Wars%22&category=jewelry&sort_on=score&limit=100&offset=0&includes=Images&api_key=fwd71s4qmujglvjf3nh6oj0k"
    
      # Prepare API request
      uri = URI.parse(polling_url)

      # Submit request
      response = JSON.parse(open(uri).read)

      items =  response["results"]

      etsy_affiliate_base_url = "http://www.awin1.com/cread.php?s=520379&amp;v=6220&amp;q=253771&amp;r=249711&amp;p="

      #{}"#{etsy_affiliate_base_url}#{item['url']}"

      items.each do |item|
        product = Product.create(
            name: item['title'],
            affiliate_url: "#{etsy_affiliate_base_url}#{item['url']}",
            image_url: item["Images"][0]['url_570xN'],
            category: "Accessories",
            final_price: item['price'],
            etsy_views: item['views'].to_i,
            affiliate: "Etsy",
            etsy_listing_id: item['listing_id']
          )
      end
  end

    task home_goods: :environment do
      polling_url = "https://openapi.etsy.com/v2/listings/active?keywords=%22Star%20Wars%22&category=home%20and%20living&sort_on=score&limit=100&offset=0&includes=Images&api_key=fwd71s4qmujglvjf3nh6oj0k"
    
      # Prepare API request
      uri = URI.parse(polling_url)

      # Submit request
      response = JSON.parse(open(uri).read)

      items =  response["results"]

      etsy_affiliate_base_url = "http://www.awin1.com/cread.php?s=520379&amp;v=6220&amp;q=253771&amp;r=249711&amp;p="

      #{}"#{etsy_affiliate_base_url}#{item['url']}"

      items.each do |item|
        product = Product.create(
            name: item['title'],
            affiliate_url: "#{etsy_affiliate_base_url}#{item['url']}",
            image_url: item["Images"][0]['url_570xN'],
            category: "Home",
            final_price: item['price'],
            etsy_views: item['views'].to_i,
            affiliate: "Etsy",
            etsy_listing_id: item['listing_id']
          )
      end
    end

    task art: :environment do
      polling_url = "https://openapi.etsy.com/v2/listings/active?keywords=%22Star%20Wars%22&category=art&sort_on=score&limit=50&offset=0&includes=Images&api_key=fwd71s4qmujglvjf3nh6oj0k"
    
      # Prepare API request
      uri = URI.parse(polling_url)

      # Submit request
      response = JSON.parse(open(uri).read)

      items =  response["results"]

      etsy_affiliate_base_url = "http://www.awin1.com/cread.php?s=520379&amp;v=6220&amp;q=253771&amp;r=249711&amp;p="

      #{}"#{etsy_affiliate_base_url}#{item['url']}"

      items.each do |item|
        product = Product.create(
            name: item['title'],
            affiliate_url: "#{etsy_affiliate_base_url}#{item['url']}",
            image_url: item["Images"][0]['url_570xN'],
            category: "Home",
            final_price: item['price'],
            etsy_views: item['views'].to_i,
            affiliate: "Etsy",
            etsy_listing_id: item['listing_id']
          )
      end
    end

    task apparel: :environment do
      polling_url = "https://openapi.etsy.com/v2/listings/active?keywords=%22Star%20Wars%22&category=clothing&sort_on=score&limit=50&offset=0&includes=Images&api_key=fwd71s4qmujglvjf3nh6oj0k"
    
      # Prepare API request
      uri = URI.parse(polling_url)

      # Submit request
      response = JSON.parse(open(uri).read)

      items =  response["results"]

      etsy_affiliate_base_url = "http://www.awin1.com/cread.php?s=520379&amp;v=6220&amp;q=253771&amp;r=249711&amp;p="

      #{}"#{etsy_affiliate_base_url}#{item['url']}"

      items.each do |item|
        product = Product.create(
            name: item['title'],
            affiliate_url: "#{etsy_affiliate_base_url}#{item['url']}",
            image_url: item["Images"][0]['url_570xN'],
            category: "Apparel",
            final_price: item['price'],
            etsy_views: item['views'].to_i,
            affiliate: "Etsy",
            etsy_listing_id: item['listing_id']
          )
      end
    end

    task general: :environment do
      polling_url = "https://openapi.etsy.com/v2/listings/active?keywords=%22Star%20Wars%22&category=clothing&sort_on=score&limit=100&offset=0&includes=Images&api_key=fwd71s4qmujglvjf3nh6oj0k"
      
      # Prepare API request
      uri = URI.parse(polling_url)

      # Submit request
      response = JSON.parse(open(uri).read)

      items =  response["results"]

      etsy_affiliate_base_url = "http://www.awin1.com/cread.php?s=520379&amp;v=6220&amp;q=253771&amp;r=249711&amp;p="

      #{}"#{etsy_affiliate_base_url}#{item['url']}"

      items.each do |item|
        product = Product.create(
            name: item['title'],
            affiliate_url: "#{etsy_affiliate_base_url}#{item['url']}",
            image_url: item["Images"][0]['url_570xN'],
            category: "Apparel",
            final_price: item['price'],
            etsy_views: item['views'].to_i,
            affiliate: "Etsy",
            etsy_listing_id: item['listing_id']
          )
      end

      polling_url = "https://openapi.etsy.com/v2/listings/active?keywords=%22Star%20Wars%22&category=clothing&sort_on=score&limit=100&offset=1&includes=Images&api_key=fwd71s4qmujglvjf3nh6oj0k"
    
      # Prepare API request
      uri = URI.parse(polling_url)

      # Submit request
      response = JSON.parse(open(uri).read)

      items =  response["results"]

      etsy_affiliate_base_url = "http://www.awin1.com/cread.php?s=520379&amp;v=6220&amp;q=253771&amp;r=249711&amp;p="

      #{}"#{etsy_affiliate_base_url}#{item['url']}"

      items.each do |item|
        product = Product.create(
            name: item['title'],
            affiliate_url: "#{etsy_affiliate_base_url}#{item['url']}",
            image_url: item["Images"][0]['url_570xN'],
            category: "Apparel",
            final_price: item['price'],
            etsy_views: item['views'].to_i,
            affiliate: "Etsy",
            etsy_listing_id: item['listing_id']
          )
      end

      polling_url = "https://openapi.etsy.com/v2/listings/active?keywords=%22Star%20Wars%22&category=clothing&sort_on=score&limit=100&offset=2&includes=Images&api_key=fwd71s4qmujglvjf3nh6oj0k"
    
      # Prepare API request
      uri = URI.parse(polling_url)

      # Submit request
      response = JSON.parse(open(uri).read)

      items =  response["results"]

      etsy_affiliate_base_url = "http://www.awin1.com/cread.php?s=520379&amp;v=6220&amp;q=253771&amp;r=249711&amp;p="

      #{}"#{etsy_affiliate_base_url}#{item['url']}"

      items.each do |item|
        product = Product.create(
            name: item['title'],
            affiliate_url: "#{etsy_affiliate_base_url}#{item['url']}",
            image_url: item["Images"][0]['url_570xN'],
            category: "Apparel",
            final_price: item['price'],
            etsy_views: item['views'].to_i,
            affiliate: "Etsy",
            etsy_listing_id: item['listing_id']
          )
      end
    end

end