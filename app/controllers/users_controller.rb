class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :my_routine]
  before_filter :correct_user,   only: [:edit, :update, :my_routine]

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
			flash[:success] = "Welcome to Routinely!"
			redirect_to @user
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
		params[:task].except('to_hour(1i)', 'to_hour(2i)', 'to_hour(3i)', 'to_hour(4i)', 'to_hour(5i)') if params[:task]['to_hour(4i)'].blank?
		@task = current_user.tasks.build(params[:task])
		@task.to_hour = nil if params[:task]['to_hour(4i)'].blank?
		#raise @task.inspect
		if @task.save
			flash[:success] = "This task was added to your routine!"
			redirect_to root_url
		else
			render 'static_pages/home'
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
