var fs = require('fs'),
	request = require('request');

var download = function(uri, filename, callback) {
	request.head(uri, function(err, res, body) {
		console.log('content-type:', res.headers['content-type']);
		console.log('content-length:', res.headers['content-length']);

		var r = request(uri).pipe(fs.createWriteStream(filename));
		r.on('close', callback);
	});
}

download('http://graphics8.nytimes.com/images/2015/04/01/technology/01bits-levchin/01bits-levchin-moth.jpg', 'test.jpg', function(){
	console.log("Done downloading");
});