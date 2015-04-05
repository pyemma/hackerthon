class KeywordsController < ApplicationController

	include MongoHelper

	def index
		@news = findKeywords(params[:keyword])
		respond_to do |format|
			format.xml { render :xml => @news }
			format.json { render :json => @news }
		end	
	end
end
