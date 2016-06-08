class AdminController < ApplicationController
	before_action :authenticate_user!
	
	def dashboard
		@clicks = Ahoy::Event.where(name:"$click")
		@visits = Visit.all
	end
end