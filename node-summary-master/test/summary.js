var summary = require('..'),
	assert = require('should');

var title = "Internet cats will never die";
var content = "(CNN)There's a famous New Yorker cartoon that features a pooch facing a PC and quipping to his fellow canine that \"On the Internet, no one knows that you\'re a dog.\"\nBut the sad doggone truth is that if you\'re a dog on the Internet, no one cares, because the geeks who rule the Web are focused on felines.\nThe digital landscape is saturated with cats. On his Diary of Numbers blog, back in 2010, Aaron Santos, physics professor and author of \"How Many Licks?\" made the rough calculation that there are about 1.3 billion cat pictures on the Internet.\nSince then, the Internet has quintupled in data size, so that number could now be 6.5 billion. That would be nearly one cat pic for every person on Earth.\nWhich helps explain why Purina, makers of Friskies cat food, estimates that a staggering 15% of all traffic on the Web is cat-related.\nAnd it\'s not just photos. There are videos, like the ones starring Maru, the Japanese cat who loves boxes, which have been viewed over 200 million times. There are cat stickers. And there are millions of cat memes — pictures overlaid with text captions, like the LOLcats of \"I Can Has Cheezburger\" fame.\nThe king of cat memes is undeniably the perpetually peeved puss named Tardar Sauce, aka \"Grumpy Cat,\" whose appearance — along with fellow Internet su-purr-stars Waffles and Nala of the #CatsOfInstagram and Oskar the Blind Cat and his brother Klaus — drew a three-block-long queue at Friskies\' \"Haus of Bacon\" pop-up café at the recent SXSW, the hipster-heavy annual gathering in Austin, Texas, that blends the worlds of technology, film and music.\nGrumpy Cat has captivated just about everyone who has met her and generated good money from merchandise sales, books, television specials and even a coffee drink called Grumpaccino. Grumpy has even allowed her human owner, Tabatha \"Tabby\" Bundesen, to quit her day job.\nThere's no canine counterpart to Grumpy Cat on the Internet. Dogs may dominate movies (hello, Lassie, Benji and Rin Tin Tin!), cartoons (Scooby, Snoopy and hundreds of dalmatians) and the book world (\"Marley and Me,\" \"Sounder,\" \"Old Yeller,\" \"Clifford\" and, er, \"Cujo\") but they've got a much tinier digital paw print than their viral rivals, and much of it is embarrassing.\nWe dog geeks disagree. Browsers of the Worldwide Web unite! We have nothing to lose but our leashes!";


summary.summarize(title, content, function(err, summary) {
    if(err) console.log("Something went wrong man!");

    console.log(summary);

    console.log("Original Length " + (title.length + content.length));
    console.log("Summary Length " + summary.length);
    console.log("Summary Ratio: " + (100 - (100 * (summary.length / (title.length + content.length)))));
});

summary.getSortedSentences(content, 5, function(err, sorted_sentences) {
    if(err) {
        console.log("There was an error."); // Need better error reporting
    }

    console.log(sorted_sentences);
});