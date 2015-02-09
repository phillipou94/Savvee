class TopicsController < ApplicationController
	include SessionsHelper

	def new
		@topic = Topic.new
		@current_user = current_user
		@topics_to_learn = @current_user.topics
	end 

	def create
		@topic = Topic.new(topic_params)
		user = current_user
		@topics_to_learn = user.topics
		if @topic.save
			user.follow_topic(@topic) #follow topic after creation
      		#render('_topic_card', object:@topic)
      		render 'new'
      		#render @topic,
         		#layout: false
    	else
    		old_topic = Topic.find_by name:@topic.name
    		user.follow_topic(old_topic)
      		render 'new'
    	end
	end 


	private 
	def topic_params
      params.require(:topic).permit(:name)
    end
end
