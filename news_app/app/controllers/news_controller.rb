class NewsController < ApplicationController
	include MongoHelper

	def index
		@new = findNews(params[:id])

		respond_to do |format|
			format.xml { render :xml => @new }
			format.json { render :json => @new }
		end
	end
end
