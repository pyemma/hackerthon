var fs = require('fs');
var MongoClient = require('mongodb').MongoClient;

MongoClient.connect('mongodb://localhost:27017/test', function (err, db) {
	if(err) throw err;

	fs.readdir('data', function (err, names) {
		if(err) throw err;
		for(var i = 0; i < names.length; i++) {

			if(names[i].charAt(0) == '.') 
				continue;

			var filename = 'data/' + names[i];
			// console.log(filename);
			fs.readFile(filename, function (err, data) {
				if(err) throw err;
				// console.log(data);
				var record = JSON.parse(data);
				// console.log(record);
				db.collection('news').insert(record, function(err, state) {
					if(err) {
						console.log("Insert failed");
						throw err;
					}
				});
			});
		}
	});

});