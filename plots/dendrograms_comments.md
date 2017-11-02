# Comments on the Dendrograms: Similarity on Inclusion/Exclusion of Items

The dendrograms are made by analyzing textual overlap between documents. "Overlap" in this cased, exclusively means overlap in the presence of lemmatized entries (disregarding order). The similarity measure used is the number of shared entries divided by the length of the shortest text. This similarity measure is always between 0 and 1. A brief text that shares all its lines with a long text will have a similarity **1**, even if these shared lines are not found together in the longer text. Two long text that essentailly may have had the same entires, but are both only partially preserved (and have limited overlap) will have low similarity, because the number of shared entries is low compared to the length of the shortest text.

The dendrogram was bootstrapped with 1,000 iterations and the resulting trees represent 50% and 75% consensus. 

![50%](consensus_tree_50.png)
![75%](consensus_tree_75.png)
