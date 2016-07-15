class StatsController < ApplicationController
 def index
    calcStats(Tag.all)
  end
  def single
 	calcStats(Tag.where(entity_id: params[:entity_id])) 
  end
  def calcStats(tags)
        logger.debug "tags dump"
        logger.debug tags
        userTags=Hash.new
        logger.debug userTags
        tags.each{|tag|
            logger.debug "full tag"
            logger.debug tag
            logger.debug tag.entity_tags
	    tag.entity_tags.each{|entity_tag|
		logger.debug "sub tag"
		logger.debug entity_tag
	      if userTags[entity_tag].nil?
		      userTags[entity_tag]=1
	      else
		      userTags[entity_tag] = userTags[entity_tag] + 1
	      end
	   }
         }
        preferredFormat = []
        userTags.each{|key,value|
          preferredFormat << {'tag'=>key,'count'=>value}
        }
        render json: preferredFormat
  end
end
