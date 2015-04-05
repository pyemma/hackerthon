import sys
sys.path.append("eatiht/")
import eatiht.v2 as v2

url = 'http://www.washingtonpost.com/blogs/the-switch/wp/2014/12/26/elon-musk-the-new-tesla-roadster-can-travel-some-400-miles-on-a-single-charge/'

print (v2.extract(url))