class SubscriptionsController < ApplicationController
	def create
		@subscription = Subscription.new(subscription_params)

		if @subscription.save
			flash[:success] = "Successfully signed up for newsletter"
			redirect_to :back
		else
			flash[:danger] = "Please use a valid email"
			redirect_to :back
		end
	end

	private

	def subscription_params
		params.require(:subscription).permit(:email)
	end
end