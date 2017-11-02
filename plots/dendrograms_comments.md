# Comments on the Dendrograms: Similarity on Inclusion/Exclusion of Items

The dendrograms are made by analyzing textual overlap between documents. "Overlap" in this cased, exclusively means overlap in the presence of lemmatized entries (disregarding order). The similarity measure used is the number of shared entries divided by the length of the shortest text. This similarity measure is always between 0 and 1. A brief text that shares all its lines with a long text will have a similarity **1**, even if these shared lines are not found together in the longer text. Two long text that essentailly may have had the same entires, but are both only partially preserved (and have limited overlap) will have low similarity, because the number of shared entries is low compared to the length of the shortest text.

The dendrogram was bootstrapped with 1,000 iterations and the resulting trees represent 50% and 75% consensus. 

![50%](consensus_tree_50.png)
![75%](consensus_tree_75.png)

Both trees create a group of four text, [P271911, P273712, P347814, and P459218](http://oracc.org/dcclt/P271911,P273712,P347814,P459218). A review of these texts show that they come from different places and times (Old Babylonian Isin, Middle Babylonian Emar, two unprovenanced Old Babylonian texts), but have one thing in common: they correspond to the second half of the Nippur list of trees and wooden objects.

The Nippur list of trees and wooden objects is one long list (some 750 entries). At several other sites this list was broken into two parts, one list that covers trees, furniture, and wagons, and another one that covers doors, agricultural tools, and miscellaneous objects. The four texts correspond in that they have entries for scales, hoes, brick molds, etc. - they do not seem to have much else in common.

The 50% tree adds the text [P346714](http://oracc.org/dcclt/P346714) which is a text from OB Ur. This text originally most probably had the entire list (trees, furniture, wagons, doors, agricultural tools, and varia), but the obverse is entirely broken. It shares a good number of entries with the shortest of the group discussed above [P273712](http://oracc.org/dcclt/P273712), and puts those (mostly) in the same order. For those reasons I argued that [P273712](http://oracc.org/dcclt/P273712) is related to the Ur tradition as represented by [P346714](http://oracc.org/dcclt/P346714). Other texts that I put in the same group are [P250364](http://oracc.org/P250364) and [P250371](http://oracc.org/dcclt/P250371). These latter two texts do end up in the same branch in both trees, but not related to the text from Ur.

The text [Q000001](http://oracc.org/dcclt/Q000001) and [P250736](http://oracc.org/dcclt/P250736) have nothing in common and do not relate to the lists of trees and wooden objects. Apparently they end up in a single branch because they consistently have a distance 1 from each other throughout the bootstrap and they mostly have a distance 1 from all other texts. In other words, the end up in the "rest" branch - with a lot of confidence.

The texts [Q000039 and P229426](http://oracc.org/dcclt/Q000039,P229426) are an interesting couple. [P229426](http://oracc.org/dcclt/P229426) is kept in a library in New York where it has no known provenance. Textually and materially it looks much like a Nippur text and **all** the lines in this text are duplicate in the composite [Q000039](http://oracc.org/dcclt/Q000039). 

To be continued.
