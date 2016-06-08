Amazon::Ecs.configure do |options|
	options[:AWS_access_key_id] = ENV[ACCESS_KEY]
	options[:AWS_secret_key] = ENV[SECRET_KEY]
	options[:associate_tag] = ENV[ASSOCIATE_TAG]
end