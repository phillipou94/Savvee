class RelationshipsController < ApplicationController

	def destroy
    	Relationship.find(params[:id]).destroy
    	redirect_to new_topic_path	
  	end
end
