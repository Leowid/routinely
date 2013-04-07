class FixController < ApplicationController

def index
	@tasks = Task.all
	@text = ""
	@tasks.each do |task| 
		@task = Task.find(task.id)
		@task.hour = "1st January 2001 "+Time.at(task.hour).strftime("%H:%M") 
		@task.to_hour = "1st January 2001 "+Time.at(task.to_hour).strftime("%H:%M") 
		@text = @text+"<br>"+@task.id.to_s+" - 1st January 2001 "+Time.at(task.hour).strftime("%H:%M") 
		@task.save(:hour => @text)
	end
	render :text => @text
end
end