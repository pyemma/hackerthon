var natural = require('natural');
var MongoClient = require('mongodb').MongoClient;

MongoClient.connect("mongodb://localhost:27017/test", function (err, db) {
	if(err) throw err;

	var TfIdf = natural.TfIdf;
	tfidf = new TfIdf();
	var map = { };

	// The news collection
	newsCollection = db.collection("news");

	// Query the number of documents
	newsCollection.count(function(err, cnt) {
		if(err) throw err;
		if(cnt == 0) {
			console.log("There is no data in the database");
			db.close();
			return;
		}
		console.log("There is total " + cnt + " data in the database");

		// Query each record and find extract the content
		var cursor = newsCollection.find({ });
		var counter = 0;
		cursor.each(function (err, doc) {
			if(err) 
				throw err;
			// console.log("The " + counter + "th document");
			if(doc == null)
				return;
			var content = doc["Summary"];
			var id = doc["_id"];

			tfidf.addDocument(content);
			map[id] = counter;
			counter += 1;
			// We have added the last document to the tfidf, and now we could do something useful
			if(counter == cnt) {
				var count = 0

				// Assumen the order are the same and there is no update during the process
				var cursor = newsCollection.find({ });
				cursor.each( function (err, doc) {
					if(err) 
						throw err;
					if(doc == null)
						return;
					var id = doc["_id"];
					var terms = tfidf.listTerms(map[id]);

					// console.log(terms.length);
					var  keywords = new Array(Math.min(10, terms.length));
					for(var k = 0; k < Math.min(10, terms.length); k++) {
						term = terms[k];
						keywords[k] = term["term"];
						// keywords[k] = { };
						// keywords[k]["keywords"] = term["term"];
						// keywords[k]["count"] = term["tfidf"];
					}
					// console.log(keywords);
					// Update the record with the computed keywords
					newsCollection.update({"_id" : id}, {"$set" : {"Keywords" : keywords}}, function (err, state) {
						if(err) throw err;

						count += 1;
						if(count == cnt)
							db.close();
					});
				});	
			}

		});
	});	
});