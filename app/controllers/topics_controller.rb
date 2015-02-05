class TopicsController < ApplicationController
	def new
		@topic = Topic.new
	end 

	def create
		@topic = Topic.new(topic_params)
		if @topic.save
			current_user.follow_topic(@topic) #follow topic after creation
      		redirect_to root_url
    	else
      		render 'new'
    	end
	end 

	private 
	def topic_params
      params.require(:topic).permit(:name)
    end
end
