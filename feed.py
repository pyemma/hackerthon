import feedparser
import summary as summ
import sys
import json
import re
sys.path.append("RAKE-master/")
sys.path.append("eatiht-master/eatiht/")
import eatiht.v2 as v2
import rake

#feed = feedparser.parse('http://rss.cnn.com/rss/edition_technology.rss')
#feed = feedparser.parse('http://feeds.bbci.co.uk/news/technology/rss.xml')
#feed = feedparser.parse('http://rss.nytimes.com/services/xml/rss/nyt/Technology.xml')
#feed = feedparser.parse('http://rss.nytimes.com/services/xml/rss/nyt/Sports.xml')
#feed = feedparser.parse('http://rss.nytimes.com/services/xml/rss/nyt/Business.xml')
#feed = feedparser.parse('http://rss.nytimes.com/services/xml/rss/nyt/World.xml')
#feed = feedparser.parse('http://rss.nytimes.com/services/xml/rss/nyt/Travel.xml')
feed = feedparser.parse('http://rss.nytimes.com/services/xml/rss/nyt/Arts.xml')
topic = feed['feed']['title']
for post in feed.entries:
	title = post.title
	link = post.link
	text_file = open("db/" + title + ".txt", 'w+')
	record = {}
	date = post.published
	if "media_content" in post:
		image = post["media_content"][0]["url"]
		record["Image"] = image
	content = v2.extract(link)
	summary = summ.getSummary(title, content)
	keyword = rake.getKeyword(content)

	record["Title"] = title
	record["Link"] = link
	record["Date"] = date
	#record["Content"] = content
	record["Summary"] = summary
	record["Keywords"] = keyword
	record["Class"] = "Arts"
	text_file.write(json.dumps(record))
	text_file.close()