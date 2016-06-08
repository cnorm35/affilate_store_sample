namespace :products do
  desc "TODO"
  task populate: :environment do
  	puts "Starting Amazon import..."
  	# Rake::Task['amazon_import:apparel'].invoke
  	# sleep(1)
  	# Rake::Task['amazon_import:toys'].invoke
  	# sleep(1)
  	# Rake::Task['amazon_import:most_popular'].invoke
  	# sleep(1)
  	# puts "Amazon import complete..."
  	# puts "Starting etsy import..."
  	Rake::Task['etsy_import:accessories'].invoke
  	Rake::Task['etsy_import:jewlery'].invoke
  	sleep(1)
  	Rake::Task['etsy_import:apparel'].invoke
  	Rake::Task['etsy_import:home_goods'].invoke
  	sleep(1)
  	Rake::Task['etsy_import:art'].invoke
  	puts "Etsy import complete..."
  	puts "Starting data cleanup"
  	Rake::Task['db:data_clean'].invoke
  	puts "Import complete and data sanitized."
  end

end
