class TasksController < ApplicationController
		respond_to :html, :json
		before_filter :signed_in_user, only: [:create, :destroy, :update]

	def index
	end

	def show
		@user = current_user
		@tasks = @user.tasks.paginate(page: params[:page])
	end

	def create
		params[:task].except('to_hour(1i)', 'to_hour(2i)', 'to_hour(3i)', 'to_hour(4i)', 'to_hour(5i)') if params[:task]['to_hour(4i)'].blank?
		@task = current_user.tasks.build(params[:task])
		@task.to_hour = "1st January 2001 "+params[:task]['to_hour(4i)']+":"+params[:task]['to_hour(5i)']
		@task.hour = "1st January 2001 "+params[:task]['hour(4i)']+":"+params[:task]['hour(5i)']  
		@task.to_hour = nil if params[:task]['to_hour(4i)'].blank?
		@user = current_user
		@tasks = @user.tasks.paginate(page: params[:page])

		respond_to do |format|
		#raise @task.inspect
		if @task.save
			format.html { redirect_to(@tasks, :notice => 'Post created.') }  
        	format.js  
		else
			render 'static_pages/home'
		end
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
		@task.update_attributes(params[:task])
		respond_with @task
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy

		respond_to do |format|
			format.html { redirect_to '/routine'}
			format.js   { render :nothing => true}
		end
	end

	private

    def correct_user
      @task = current_user.task.find_by_id(params[:id])
      redirect_to root_url if @task.nil?
    end
end