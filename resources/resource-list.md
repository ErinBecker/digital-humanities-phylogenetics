# Some links folks on Twitter thought might be helpful  
## Nicholas Matzke: Evolution of anti-evolutionists
http://www.vox.com/science-and-health/2015/12/17/10434458/creationism-is-evolving  

Phylogenetic approach to anti-evolutionary (creationist) policies in local and state legislation, taking account of pressures (such as federal legislation). The article is very unclear about methodology - one should probably consult the original [Science](http://science.sciencemag.org/content/351/6268/28.full) article.

## Mike Kestemont: Hildegard von Bingen and her Secretary
http://www.mike-kestemont.org/  

Author attribution: were these documents written by Hildegard von Bingen or by her secretary? The analysis is based on the usage of function words such as articles, prepositions, etc. The usage of function words is not immediately applicable to Sumerian sources - but the type of analysis (clustering) may well be interesting. Mike Kestemont also does 'n-gram' analysis - where n-gram refers to the number of characters (not words).

## Folgert Karsdorp, Antal van den Bosch: Roodkapje (Little Red Riding Hood)
http://rsos.royalsocietypublishing.org/content/3/6/160071  

Analysis of some 300 versions of Little Riding Hood in Dutch, creating a network of dependencies. Based on distance measurements and on bag-of-words approach (many words in common = small distance). Very interesting for the network theory behind it. The BOW ignores word order, which is not appropriate for the current project. Distance and network are most intruiging.

## Kellen Funk and Lincoln Mullen: dependencies among 19th century American legal codes (Field Codes)
http://lmullen.github.io/civil-procedure-codes/  

Similarities between field codes to detect dependencies, working with 5-grams (see their [working paper](http://lmullen.github.io/civil-procedure-codes/talks/dh-working-group/Funk-Mullen.Migration-Field-Code.working-paper.pdf)) and Jaccard similarity score. The dependencies between codes are not wholesale, but rather based on sections. That is, a code may borrow sections from various other codes. The result is a network of codes (with New York at the heart), but also graphs that show the origin of each section in a single code. The full scripts are available on Github (in R).

## Jamshid J. Tehrani: The Phylogeny of Little Red Riding Hood
http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0078871  

Analysis of 58 versions of two related fairy tales: "Little Red Riding Hood" and "the Wolf and the Kids." The study takes a distincly phylogenetic perspective, asking how these versions depend on each other. The analysis is based on identification of motifs and characters (I believe by hand-coding them). The recorded stories come from Europe, Middle East, Africa and the Far East. The analysis shows that "Little Red Riding Hood" and "The Wolf and the Kids" are clearly separate branches (or clades). The third branch, which comprises the Far Eastern stories, references elements of both stories, which is interpreted as a later conflation of the two.
The analysis uses three different statistical approaches: 1. Cladistic analysis searching for the 'Most Parimonous Tree'; 2. Bayseian inference and 3. NeighborNet. Each of these approaches has statistics to describe the strength or probability of the solution found. Of these three, NeighbornNet may be most interesting because it allows for overlap and intersection.

The article includes extensive bibliography, including studies that use phylogenetic methods for cultural history (or *phylomemetic analysis*).


## Adrian C. Barbrook e.a. Phylogeny of Canterbury Tales
http://www.nature.com/nature/journal/v394/n6696/full/394839a0.html  

Phylogenetic reconstruction of one of the tales in the Cantebury Tales based on 58 manuscripts. The study finds several branches of the tradition and manuscripts that may be close to Chaucer's original. Fourteen manuscripts are left out because they appear to have used multiple originals from different branches. It is not clear what the analysis is based upon (words, spelling, phrases?) or how the data were acquired. Article dates to 1998(!) and it is unlikely that the software used would still be current. The ommission of 14 manuscripts because of their mixed origin seems arbitrary - the mixed nature of manuscript tradition is an important feature of how such tradition works. The analysis does not seem to include chronological information. The Splits-tree structure of the resulting graph is interesting.

## Viral Texts Mapping Networks of Reprinting in 19th-Century Newspapers and Magazines
https://viraltexts.org/  

NEH supported project at Northeastern. Finding duplicates (poems, articles, jokes) in large amounts of OCRed newspapers. A [methods article](http://viraltexts.org/2015/05/22/computational-methods-for-uncovering-reprinted-texts-in-antebellum-newspapers/) by David Smith, Ryan Cordell, and Abby Mullen describes a. how to reduce the billions of potential matches (based on 5-grams - matching sequences of 5 words) to consider and b. how to deal with partial matches (due to OCR errors or small changes in a poem). Quote: "A simple Levenshtein edit distance model, which is commonly applied in natural language processing (see, for instance, Gusfield’s textbook for an extensive discussion), aligns these two strings with three character substitutions (in red) and one character insertion."

## Google ngram viewer
https://books.google.com/ngrams  
Displays a graph of one or more ngrams (n = 1 to 5) distributed over time. Different languages available. The data set can be accessed (that is, the complete set of ngrams for the languages included).

## Guilherme D. Marmerola e.a. On the Reconstruction of Text Phylogeny Trees: Evaluation and Analysis of Textual Relationships
http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0167822  

Using a variety of computational methods to build a phylogenetic tree of near-duplicate documents. Three different methods for calculating dissimilarity and three different approaches to building the phylogenetic tree, comparing the performance of each.
Dissimilarity measures include 'edit distance', 'Normalized Compression Distance' (based on the size of compressed files), and vector distance, based on tf-idf weighing. The three approaches to building the phylogenetic tree include 'minimum cost heuristic' and two supervised machine-learning algoritms to classify documents as 'original' or 'reused' : 'Support Vector Machines' and 'Rondom Forrest.'

The framework developed here may not be directly applicable to Sumerian texts, but it contains a wealth of ideas and potential approaches.

# People to follow up with  
@acerbialberto  
@ryancordell  
@FolgertK (http://www.karsdorp.io/ )  
@Mike_Kestemont  
@billhd 
@tla   
@justingrimmer  
Paul Hackett and his email is ph2046@columbia.edu - recommendation from David Grinspoon.  
