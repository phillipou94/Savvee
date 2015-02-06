class TopicsController < ApplicationController

	def new
		@topic = Topic.new
	end 

	def create
		@topic = Topic.new(topic_params)
		if @topic.save
			user = User.find(1)
			user.follow_topic(@topic) #follow topic after creation
      		#render('_topic_card', object:@topic)
      		render 'new'
    	else
      		render 'new'
    	end
	end 

	private 
	def topic_params
      params.require(:topic).permit(:name)
    end
end
