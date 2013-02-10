class TasksController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]

	def index
	end

	def show
		@user = current_user
		@tasks = @user.tasks.paginate(page: params[:page])
	end

	def create
		@task = current_user.tasks.build(params[:task])
		if @task.save
			flash[:success] = "This task was added to your routine!"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	def destroy
	end

	def edit
		@user = current_user
		@task = Task.find(params[:id])
	end

	def update
		@user = current_user
		@task = Task.find(params[:id])
		if @task.update_attributes(params[:task])
			flash[:success] = "Task saved!"
			redirect_to @user 
		else
			render 'edit'
		end
	end
end