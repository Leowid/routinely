class StaticPagesController < ApplicationController

	def home

		# signed in? don't let them see the landing page
		redirect_to current_user if signed_in?

		# signed out? show the landing page stuff
		@task = current_user.tasks.build if signed_in?
		@user = User.find(current_user.id) if signed_in?
		@tasks = @user.tasks.paginate(page: params[:page]) if signed_in?
		@home_page = true if !signed_in?
	end
end
