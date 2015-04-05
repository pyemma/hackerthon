// var express = require('express');
var fs = require('fs');
var mongoose = require('mongoose');
var Schema = mongoose.Schema;
 
// img path
var imgPath = '/Users/peiyang/Desktop/150112175813-cymatics-science-vs-music-nigel-stanford-orig-mg-00011105-top-tease.jpg';
 
// connect to mongo
mongoose.connect('localhost', 'test');
 
// example schema
var schema = new Schema({
    img: { data: Buffer, contentType: String }
});
 
// our model
var Img = mongoose.model('Img', schema);
 
mongoose.connection.on('open', function () {
    console.error('mongo is open');
    // store an img in binary in mongo
    var im = new Img;
    im.img.data = fs.readFileSync(imgPath);
    im.img.contentType = 'image/jpg';
    im.save(function (err, doc) {
      if (err) throw err;
 
      console.error('saved img to mongo');

    });
});