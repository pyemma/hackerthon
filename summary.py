# coding=UTF-8
from __future__ import division
import re
 
# This is a naive text summarization algorithm
# Created by Shlomi Babluki
# April, 2013
 
 
class SummaryTool(object):
 
    # Naive method for splitting a text into sentences
    def split_content_to_sentences(self, content):
        content = content.replace("\n", ". ")
        return content.split(". ")
 
    # Naive method for splitting a text into paragraphs
    def split_content_to_paragraphs(self, content):
        return content.split("\n\n")
 
    # Caculate the intersection between 2 sentences
    def sentences_intersection(self, sent1, sent2):
 
        # split the sentence into words/tokens
        s1 = set(sent1.split(" "))
        s2 = set(sent2.split(" "))
 
        # If there is not intersection, just return 0
        if (len(s1) + len(s2)) == 0:
            return 0
 
        # We normalize the result by the average number of words
        return len(s1.intersection(s2)) / ((len(s1) + len(s2)) / 2)
 
    # Format a sentence - remove all non-alphbetic chars from the sentence
    # We'll use the formatted sentence as a key in our sentences dictionary
    def format_sentence(self, sentence):
        sentence = re.sub(r'\W+', '', sentence)
        return sentence
 
    # Convert the content into a dictionary <K, V>
    # k = The formatted sentence
    # V = The rank of the sentence
    def get_senteces_ranks(self, content):
 
        # Split the content into sentences
        sentences = self.split_content_to_sentences(content)
 
        # Calculate the intersection of every two sentences
        n = len(sentences)
        values = [[0 for x in range(n)] for x in range(n)]
        for i in range(0, n):
            for j in range(0, n):
                values[i][j] = self.sentences_intersection(sentences[i], sentences[j])
 
        # Build the sentences dictionary
        # The score of a sentences is the sum of all its intersection
        sentences_dic = {}
        for i in range(0, n):
            score = 0
            for j in range(0, n):
                if i == j:
                    continue
                score += values[i][j]
            sentences_dic[self.format_sentence(sentences[i])] = score
        return sentences_dic
 
    # Return the best sentence in a paragraph
    def get_best_sentence(self, paragraph, sentences_dic):
 
        # Split the paragraph into sentences
        sentences = self.split_content_to_sentences(paragraph)
 
        # Ignore short paragraphs
        if len(sentences) < 2:
            return ""
 
        # Get the best sentence according to the sentences dictionary
        best_sentence = ""
        max_value = 0
        for s in sentences:
            strip_s = self.format_sentence(s)
            if strip_s:
                if sentences_dic[strip_s] > max_value:
                    max_value = sentences_dic[strip_s]
                    best_sentence = s
 
        return best_sentence
 
    # Build the summary
    def get_summary(self, title, content, sentences_dic):
 
        # Split the content into paragraphs
        paragraphs = self.split_content_to_paragraphs(content)
 
        # Add the title
        summary = []
        summary.append(title.strip())
        summary.append("")
 
        # Add the best sentence from each paragraph
        for p in paragraphs:
            sentence = self.get_best_sentence(p, sentences_dic).strip()
            if sentence:
                summary.append(sentence)
 
        return ("\n").join(summary)
 
def getSummary(title, content):
    st = SummaryTool()
 
    # Build the sentences dictionary
    sentences_dic = st.get_senteces_ranks(content)
 
    # Build the summary with the sentences dictionary
    summary = st.get_summary(title, content, sentences_dic)
    return summary

# Main method, just run "python summary_tool.py"
def main():
 
    # Demo
    # Content from: "http://thenextweb.com/apps/2013/03/21/swayy-discover-curate-content/"
 
    title = """
    Internet cats will never die
    """
 
    content = """
    (CNN)There's a famous New Yorker cartoon that features a pooch facing a PC and quipping to his fellow canine that "On the Internet, no one knows that you're a dog."

But the sad doggone truth is that if you're a dog on the Internet, no one cares, because the geeks who rule the Web are focused on felines.

The digital landscape is saturated with cats. On his Diary of Numbers blog, back in 2010, Aaron Santos, physics professor and author of "How Many Licks?" made the rough calculation that there are about 1.3 billion cat pictures on the Internet.

Since then, the Internet has quintupled in data size, so that number could now be 6.5 billion. That would be nearly one cat pic for every person on Earth.

Which helps explain why Purina, makers of Friskies cat food, estimates that a staggering 15% of all traffic on the Web is cat-related.

And it's not just photos. There are videos, like the ones starring Maru, the Japanese cat who loves boxes, which have been viewed over 200 million times. There are cat stickers. And there are millions of cat memes — pictures overlaid with text captions, like the LOLcats of "I Can Has Cheezburger" fame.

The king of cat memes is undeniably the perpetually peeved puss named Tardar Sauce, aka "Grumpy Cat," whose appearance — along with fellow Internet su-purr-stars Waffles and Nala of the #CatsOfInstagram and Oskar the Blind Cat and his brother Klaus — drew a three-block-long queue at Friskies' "Haus of Bacon" pop-up café at the recent SXSW, the hipster-heavy annual gathering in Austin, Texas, that blends the worlds of technology, film and music.

Grumpy Cat has captivated just about everyone who has met her and generated good money from merchandise sales, books, television specials and even a coffee drink called Grumpaccino. Grumpy has even allowed her human owner, Tabatha "Tabby" Bundesen, to quit her day job.

There's no canine counterpart to Grumpy Cat on the Internet. Dogs may dominate movies (hello, Lassie, Benji and Rin Tin Tin!), cartoons (Scooby, Snoopy and hundreds of dalmatians) and the book world ("Marley and Me," "Sounder," "Old Yeller," "Clifford" and, er, "Cujo") but they've got a much tinier digital paw print than their viral rivals, and much of it is embarrassing.

So what gives? Why is the Internet so darned crazy about cats?

The most frequently cited answer to this puzzling question is a practical one. Felines aren't outdoor companion animals; when they walk outside, they walk alone. As a result, cat owners eager to show off their pals or interact with their peers don't have an easy way to socialize. "The Internet is the dog park for cats," notes Niky Roberts, spokesperson for Friskies. "I follow cats online to connect with other cat people."

Other experts point to the uniquely mysterious nature of felines — which led to their being worshiped as gods in ancient Egypt, feared as demons in ancient Japan and associated with magic just about everywhere (and isn't the Internet just another form of magic?).

As viral meme expert Sam Ford, author of the book "Spreadable Media," notes that while dogs interact like humans, cats do not. "Cats have an alien quality to them, a mystique that drives our interest in projecting emotions onto them."

Derek Liu, co-caretaker of Waffles the Cat, agrees. "They're eccentric creatures," he says. "Some cats, not naming names, do nothing but sit in the bathroom staring at the water in the toilet all day. And they don't respond to you predictably. They come if they want, not if you want them to."

And that might be the ultimate explanation for why cats are so big on the Web. As enigmatic, homebound individuals with unconventional obsessions, unusual interests and limited social skills, "They have a lot in common with the people who spend the most time on the Internet," says Joshua Green, vice president of digital strategy at Arnold Worldwide. "The centrality of cats to the digital world is because they have a cultural connection to the people who live there. The fact is, cats are just better nerd pets."

As a card-carrying nerd and a staunch member of Team Dog, I find that unfair and irrational. Dogs are loyal, loving companions. At their fickle best, cats merely tolerate their owners as a source of food and attention on demand. Dogs aim to please (and when they fail, they express shame with extreme cuteness).

Cats, meanwhile, knock stuff off other stuff and LOL about it afterward. Dogs can be trained to do helpful and useful things. Cats will only wait a day before eating you if you die. In short, dogs are the hot cocoa of pets; cats are grapefruit juice.

Do nerds really need another source of social rejection and emotional withholding that walks on keyboards and spills liquids onto electronics for fun and has no obvious utility other than being decorative?

We dog geeks disagree. Browsers of the Worldwide Web unite! We have nothing to lose but our leashes!

    """
 
    # Create a SummaryTool object
    st = SummaryTool()
 
    # Build the sentences dictionary
    sentences_dic = st.get_senteces_ranks(content)
 
    # Build the summary with the sentences dictionary
    summary = st.get_summary(title, content, sentences_dic)
 
    # Print the summary
    print (summary)
 
    # Print the ratio between the summary length and the original length
    print ("")
    print ("Original Length %s" % (len(title) + len(content)))
    print ("Summary Length %s" % len(summary))
    print ("Summary Ratio: %s" % (100 - (100 * (len(summary) / (len(title) + len(content))))))
 
 
if __name__ == '__main__':
    main()