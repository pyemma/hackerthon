require('mongo')
require('bson')

module MongoHelper

	# The helper function to return the keywords associate with
	# one category
	def findCategory(category)
		init() if !$client
		aggregation = $client[:news].find.aggregate([
			{ :$match => {"Class" => category}},
			{ :$project => {"_id" => 0, "Keywords" => 1}},
			{ :$unwind => "$Keywords"},
			{ :$group => {"_id" => "$Keywords", "count" => {:$sum => 1}}},
			{ :$sort => {"count" => -1}},
			{ :$limit => 50 }
			])
		result = []
		aggregation.each do |document|
			result << document
		end
		return result
	end

	def findCategoryNews(category)
		init() if !$client
		documents = $client[:news].find({"Class" => category})
		result = []
		documents.each do |document|
			result << document
		end
		return result
	end
	# The helper function to return the news list associate with
	# one keyword
	def findKeywords(keywords)
		init() if !$client
		documents = $client[:news].find({:$text => {:$search => keywords}})
		result = []
		documents.each do |document|
			result << document
		end
		return result
	end
	# The helper function to return the news of a specific id
	def findNews(id)
		init() if !$client

		result = []
		return result if !BSON::ObjectId.legal?(id)

		documents = $client[:news].find({:_id => BSON::ObjectId.from_string(id)})
		documents.each do |document|
			result << document
		end
		return result
	end

	private
	@@databasePath = '127.0.0.1:27017'
	$client = nil
	# The helper function to initialize the connection to database
	def init()
		$client ||= Mongo::Client.new([@@databasePath], :database => 'test', :heartbeat_frequency => 1200)
	end
end