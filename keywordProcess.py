import os
from topia.termextract import extract
extractor = extract.TermExtractor()

path = 'origindata'
files = os.listdir(path)

keywords = {}
fileKeywords = [];

for filename in files:
	if filename[0] == '.':
		continue
	file = open(path + '/' + filename)

	text = file.read()
	# print text
	result = sorted(extractor(text))
	records = []
	# proofing the digits and symbols
	for tup in result:
	    st = tup[0]
	    strs = st.split(' ')
	    stats = True
	    for s in strs:
	        if s.isalpha() == False:
	            stats = False
	    
	    if stats == True:
	    	# counting each single words appear in the keywords
	        for s in strs:
	        	if s in keywords:
	        		keywords[s] += 1
	        	else:
	        		keywords[s] = 1
	        records.append(st)

	    fileKeywords.append(records)

