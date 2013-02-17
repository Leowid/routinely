class TasksController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]

	def index
	end

	def show
		@user = current_user
		@tasks = @user.tasks.paginate(page: params[:page], order: 'hour')

	end

	def create
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

	def edit
		@user = current_user
		@task = Task.find(params[:id])
	end

	def update
		params[:task].except('to_hour(1i)', 'to_hour(2i)', 'to_hour(3i)', 'to_hour(4i)', 'to_hour(5i)') if params[:task]['to_hour(4i)'].blank?
		@user = current_user
		@task = Task.find(params[:id])
		@task.to_hour = nil if params[:task]['to_hour(4i)'].blank?
		if @task.update_attributes(params[:task])
			flash[:success] = "Task saved!"
			redirect_to @user 
		else
			render 'edit'
		end
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		flash[:success] = "It's gone, one less thing to worry about! :)"
		redirect_to current_user
	end

	private

    def correct_user
      @task = current_user.task.find_by_id(params[:id])
      redirect_to root_url if @task.nil?
    end
end