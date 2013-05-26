class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :my_routine]
  before_filter :correct_user,   only: [:edit, :update, :my_routine]


	def routine
		# signed out? show the landing page stuff
		@task = current_user.tasks.build if signed_in?
		@user = User.find(current_user.id) if signed_in?
		@tasks = @user.tasks.paginate(page: params[:page]) if signed_in?
		@home_page = true if !signed_in?
	end

	def show
		@user = User.find(params[:id])
		@tasks = @user.tasks.paginate(page: params[:page])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			UserMailer.signup_email(@user).deliver
			flash[:success] = "Welcome to Routinely!"
			redirect_to "/home"
		else
			render 'new'
		end
	end

	def edit
	end

	def my_routine
		@user = User.find(params[:id])
	end

	def update
		if @user.update_attributes(params[:user])
			flash[:success] = "Profile updated"
			sign_in @user
			redirect_to @user
		else
			render 'edit'
		end
	end

	private

		def signed_in_user
			redirect_to signin_url, notice: "Please sign in." unless signed_in?
		end

		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_path) unless current_user?(@user)
		end
end
