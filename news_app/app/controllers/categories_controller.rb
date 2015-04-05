class CategoriesController < ApplicationController

	include MongoHelper
	
	def index
		@keywords = findCategory(params[:category])
		respond_to do |format|
			format.xml { render :xml => @keywords }
			format.json { render :json => @keywords }
		end
	end

	def all
		@news = findCategoryNews(params[:category])
		respond_to do |format|
			format.xml { render :xml => @news }
			format.json { render :json => @news }
		end
	end
end
