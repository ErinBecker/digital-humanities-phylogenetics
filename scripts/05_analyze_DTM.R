We next convert the dataframe from wide format to long format. In wide format, each document is a row and each entry is a column. There are as many observed values per row as their are entries. In long format, each document/entry combination is a row and there is only one observed value per row.

head(dtm_df)

# Entry overlap across document pairs

To help understand the scale and pattern of shared entries across the corpus, we want to build a dataframe to store the absolute number of (unique) shared entries between each document pair. This will not count duplicated entries within one of the two documents.

melted_dtm_df = melt(dtm_df)
tail(melted_dtm_df)

# function to extract entries of any specified document
get_entries = function(df, doc) {
  as.character(df[which(df$document == doc &
                          df$value == 1),]$variable)
}

# function to get number of shared entries for any specified document pair
get_shared_entries = function(df, doc1, doc2) {
  doc1_entries = get_entries(df, doc1)
  doc2_entries = get_entries(df, doc2)
  length(which(doc1_entries %in% doc2_entries))
}

# do this for all possible document pairs

# initialize an empty dataframe
docs = unique(melted_dtm_df$document)

all_pairs = combinations(length(docs), 2, docs, repeats.allowed = F)
all_pairs = as.data.frame(all_pairs, stringsAsFactors = FALSE)
all_pairs$doc1 = all_pairs$V1
all_pairs$doc2 = all_pairs$V2
all_pairs$V1 = NULL
all_pairs$V2 = NULL

all_pairs$num_shared_entries = NA

# compute the number of shared entries for each pair and add to dataframe
for(i in 1:nrow(all_pairs)) {
  all_pairs[i,]$num_shared_entries = 
    get_shared_entries(melted_dtm_df, all_pairs[i,]$doc1, all_pairs[i,]$doc2)
}

head(all_pairs)

# reorder the new data frame so that the document pairs with 
# the most shared entries are on topic

all_pairs = all_pairs[order(-all_pairs$num_shared_entries),] 
head(all_pairs,)

# Distance metric

We would like to use a distance metric that takes into account document length. 

similarity = (number of shared entries / length of shortest text in pair)

distance = 1 - similarity

# add back in num_entries column
# note that we had to remove it to build melted dataframe
dtm_df$num_entries = rowSums(dtm_df[1:cols_to_sum])
head(dtm_df["num_entries"])

# calculate similarity metric and add to dataframe

all_pairs$similarity = NA
all_pairs$distance = NA

get_num_entries = function(df, doc) {
  df[which(df$document == doc),]$num_entries 
}

for(i in 1:nrow(all_pairs)) {
  doc1_entries = get_num_entries(dtm_df, all_pairs[i,]$doc1)
  doc2_entries = get_num_entries(dtm_df, all_pairs[i,]$doc2)
  
  all_pairs[i,]$similarity = 
    all_pairs[i,]$num_shared_entries / min(doc1_entries, doc2_entries)
  
  all_pairs[i,]$distance = 1 - all_pairs[i,]$similarity
}

tail(all_pairs)

all_pairs[which(all_pairs$doc2 == "Q000039" & all_pairs$doc1 == "Q000001"),]

We can visualize this melted dataframe as a heatmap. Each document is a row and each unique entry is a column in the heatmap below. Red represents an entry being present in a document while blue represents absence.

# http://stackoverflow.com/questions/10397183/heat-map-of-binary-data-using-r-or-python

q = qplot(data = melted_dtm_df, x=variable, y=document, fill=factor(value),
          geom="tile")+scale_fill_manual(values=c("0"="lightblue", "1"="red")) +
  theme(axis.text.x=element_blank(), axis.text.y = element_text(size = 5))

suppressWarnings(print(q))

Note that Q000001 is included as an outlier. It is a composite document of lists of animals should share very few entries with the documents included in this corpus. The heatmap above shows good separation between Q000001 and Q000039. That region of the plot is shown separately below.

Q_docs = c("Q000001", "Q000039")
Q_doc_data = melted_dtm_df[melted_dtm_df$document %in% Q_docs,]

q2 = qplot(data = Q_doc_data, x=variable, y=document, fill=factor(value),
           geom="tile")+scale_fill_manual(values=c("0"="lightblue", "1"="red")) +
  theme(axis.text.x=element_blank(), axis.text.y = element_text(size = 5))

suppressWarnings(print(q2))

## Grouping Documents by Entry Similarity  
We can use hierarchical clustering with our presence/absence matrix to uncover groups of similar documents. Ideally, we can benchmark these clusters' accuracy in uncovering geographically or chronologically related documents by looking at metadata, but for this collection the metadata may be too sparse to do that benchmarking.  

In either case, we can establish a workflow for doing hierarchical clustering and apply that to other datasets with better provenance information to test for cluster utility. 



## Adding provenience by using [ORACC](http://oracc.org) metadata

# Bring in metadata
metadata = read.csv("../data/metadata/dcclt_cat.csv")

# rename metadata "X" column to "document" for merging with our dataframe
metadata$document = metadata$X
metadata$X = NULL
head(metadata)

metadata[which(metadata$provenience == ""),]

# Drop metadata for documents not in this dataset
docs = unique(rownames(dtm_df))
metadata = metadata[which(metadata$document %in% docs),]
nrow(metadata)

all_pairs = all_pairs[,c("doc1", "doc2", "distance")]
head(all_pairs)

# create distance matrix object
all_pairs_matrix = acast(all_pairs, doc1 ~ doc2, value.var='distance', fun.aggregate = sum, margins=FALSE)

head(all_pairs_matrix)

all_pairs_matrix["Q000001","Q000039"]


##remove document column from our dataframe (this information is also saved in the rownames)
#dtm_df$document = NULL

# create clusters
# first transform the df to a matrix and then remove names 
# if the names aren't removed, you get a matrix full of zeros (???)
all_pairs_matrix2 = data.matrix(all_pairs_matrix)
clusters = hclust(dist((all_pairs_matrix2)))

# clusters <- hclust(dist(dtm_df))

str(dist(unname(all_pairs_matrix2)))

ggdendrogram(clusters, rotate = TRUE)

# Export plot to pdf
pdf("../plots/dtm_dendrogram_binary_rm_rare_keep_outliers.pdf")
ggdendrogram(clusters, rotate = TRUE) + theme(axis.text.y = element_text(size = 4))
dev.off()

# Notes 

Dendrograms have some elements of stoichasticisity in them, so the plot may not be identical when run multiple times. This is why we do bootstraping to find the level of confidence we have in each node (split in the tree). 

I want to re-build the tree after removing entries that appear only once in the corpus and see if it makes sense. Is there a reason why we would or would not remove very rare entries?

# Niek's Commentary
The two texts that do not belong are [Q000001](http://oracc.org/dcclt/Q000001) and [P250736](http://oracc.org/dcclt/P250736). Both end up - together with [Q000039](http://oracc.org/dcclt/Q000039)! - in the bottom of the graph.

# Erin's Note: 
When I built the tree, [P250736](http://oracc.org/dcclt/P250736) groups with [P271911](http://oracc.org/dcclt/P271911), then to [Q000039](http://oracc.org/dcclt/Q000039) and then to [Q000001](http://oracc.org/dcclt/Q000001). I'm worried that we have a problem with [long-branch attraction](https://en.wikipedia.org/wiki/Long_branch_attraction): all of the closely related documents at the bottom of the tree are the longest documents in the corpus. Long-branch attraction is a systematic problem in phylogenetics when two or more groups that are not closely related to anything else in the dataset (including each other) cluster together. In our case, this could be due to absolute length of the documents, or to the presence of many entries in long documents that don't occur in any of the other documents. 

Apparently we can test for long-branch attraction using the "SAW" method, discussed [here](https://en.wikipedia.org/wiki/Long_branch_attraction#Results).
                                                                                           
                                                                                           _________
                                                                                           
                                                                                           I ran the notebook again after removing rare entries (entries that only appear in one document). In both versions (with and without rare entries), [P235262](http://oracc.org/dcclt/P235262) and [P370399](http://oracc.org/dcclt/P370399) are sisters.
                                                                                           
                                                                                           Q000001 should be excluded from the step where we remove rare entries, as otherwise it has only 3 entries left and will not appear as an outlier, as it should.
                                                                                           
                                                                                           I'd like to also make a table of the number of entries shared between each document to give us an idea of the scale of variation we're seeing.
                                                                                           
                                                                                           
                                                                                           
                                                                                           __________
                                                                                           
                                                                                           # Niek's Commentary
                                                                                           
                                                                                           Two clusters of texts (9 documents) in the top of the graph seem to have little relation to each other:
                                                                                             
                                                                                             | text | period | provenience |
                                                                                             |------|--------|-------------|
                                                                                             |[P459218](http://oracc.org/dcclt/P459218)| OB | Isin |
                                                                                             |[P250364](http://oracc.org/dcclt/P250364)| OB | unknown (Ur?) |
                                                                                             |[P437074](http://oracc.org/dcclt/P437074)| MB | Hattuša |
                                                                                             |[P253866](http://oracc.org/dcclt/P253866)| OB | unknown |
                                                                                             |-------------------------------|----|---------|
                                                                                             |[X100003](http://oracc.org/dcclt/X100003)| MB | Ibn Hani (Ugarit)|
                                                                                             |[P432448](http://oracc.org/dcclt/P432448)| OB | unknown |
                                                                                             |[P332939](http://oracc.org/dcclt/P332939)| MB | Ugarit|
                                                                                             |[P253233](http://oracc.org/dcclt/P253233)| OB | unknown|
                                                                                             |[P253228](http://oracc.org/dcclt/P253228)| OB | unknown|
                                                                                             
                                                                                             There are four texts that have the rare item *ne-gi-pu-um* also spelled *ne-ki-pu-um*, namely
                                                                                           * [P247864](http://oracc.org/dcclt/P247864) from Šaduppum
                                                                                           * [P273880](http://oracc.org/dcclt/P273880) unknown provenance
                                                                                           * [P388265](http://oracc.org/dcclt/P388265) unknown provenance
                                                                                           * [P347814](http://oracc.org/dcclt/P347814) unknown provenance
                                                                                           
                                                                                           In all these cases the word is preceded by an (equally rare) synonym *ka-ta-pu-um*. Both words are unknown in later lexical tradition.
                                                                                           
                                                                                           The four texts are more or less grouped towards the bottom of the graph - they are linked at a fairly high level (can we highlight them?)
                                                                                           
                                                                                           The category "Isin" is more or less meaningless. This includes some very short (3-line) texts that do not have much in common with each other (and overlap of max. three lines with the longer texts). The three longer texts include
                                                                                           * [P459218](http://oracc.org/dcclt/P459218) second half of the list
                                                                                           * [P459217](http://oracc.org/dcclt/P459217) first half of the list
                                                                                           * [P459216](http://oracc.org/dcclt/P459216) first half of the list
                                                                                           
                                                                                           The first, predictably, does not correlate with the other two, but the last two do link. They are reasonably close to [P235262](http://oracc.org/dcclt/P235262)(KM 89542; unprovenanced), which seems to be closely related to the Isin tradition. In between the Isin texts. In between KM 89542 and the Isin texts are [P370399](http://oracc.org/dcclt/P370399) (unprovenanced) and [P271771](http://oracc.org/dcclt/P271771) (Emar). The Emar text is MB (all the others listed are OB), but belongs to the so-called "Syrian" tradition in Emar that is much closer to the OB tradition than other Emar texts. All these texts are of substantial length - it is possible that we have a real connection here.
                                                                                           
                                                                                           [P346714](http://oracc.org/dcclt/P346714) (from Ur) and [P250364](http://oracc.org/dcclt/P250364) (unprovenanced, tradition looks like Ur) end up at different ends of the graph.
                                                                                           
                                                                                           Texts from Ugarit and Ibn Hani and some from Emar are supposed to be closely related. Can we pull them out?
                                                                                           
                                                                                           Conclusions: very short texts do not yield interpretable results and can only be used if they have a rare item or rare spelling.
                                                                                           The "Isin" group needs more research. Display heatmaps of smaller groups of texts?
                                                                                           
                                                                                           # Add colors to dendrogram by provenance
                                                                                           numColors = length(levels(factor(metadata$provenience)))
                                                                                           numColors
                                                                                           
                                                                                           getPalette = colorRampPalette(brewer.pal(10, "Set3"))
                                                                                           
                                                                                           myPalette = getPalette(numColors)
                                                                                           
                                                                                           names(myPalette) = levels(factor(metadata$provenience))
                                                                                           print(names(myPalette))
                                                                                           show_col(myPalette)
                                                                                           
                                                                                           dtm_df$document = rownames(dtm_df)
                                                                                           dtm_df = merge(dtm_df, metadata, by = "document")
                                                                                           
                                                                                           labelCol = function(x) {
                                                                                             if (is.leaf(x)) {
                                                                                               # fetch label
                                                                                               label = attr(x, "label")
                                                                                               # print(label)
                                                                                               group = metadata[which(metadata$document == label),"provenience"]
                                                                                               group_col = unname(myPalette[as.character(group)])
                                                                                               #    attr(x, "nodePar") = list(lab.col = ifelse(label %in% c("A", "B"), "red", "blue"))
                                                                                               attr(x, "nodePar") = list(lab.col = group_col)
                                                                                             }
                                                                                             return(x)
                                                                                           }
                                                                                           
                                                                                           ## apply labelCol on all nodes of the dendrogram
                                                                                           #par(cex=0.5)
                                                                                           plot(dendrapply(as.dendrogram(clusters), labelCol))
                                                                                           
                                                                                           pdf("../plots/dendrogram_w_provenience.pdf")
                                                                                           #par(cex=0.3)
                                                                                           plot(dendrapply(as.dendrogram(clusters), labelCol))
                                                                                           dev.off()
                                                                                           
                                                                                           # Add colors to dendrogram by period
                                                                                           numColors = length(levels(factor(metadata$period)))
                                                                                           numColors
                                                                                           myPalette = brewer_pal(palette = "Paired")(numColors)
                                                                                           names(myPalette) = levels(factor(metadata$period))
                                                                                           print(names(myPalette))
                                                                                           show_col(myPalette)
                                                                                           
                                                                                           labelCol = function(x) {
                                                                                             if (is.leaf(x)) {
                                                                                               # fetch label
                                                                                               label = attr(x, "label")
                                                                                               # print(label)
                                                                                               group = metadata[which(metadata$document == label),"period"]
                                                                                               group_col = unname(myPalette[as.character(group)])
                                                                                               attr(x, "nodePar") = list(lab.col = group_col)
                                                                                             }
                                                                                             return(x)
                                                                                           }
                                                                                           
                                                                                           ## apply labelCol on all nodes of the dendrogram
                                                                                           #par(cex=0.5)
                                                                                           plot(dendrapply(as.dendrogram(clusters), labelCol))
                                                                                           
                                                                                           pdf("../plots/dendrogram_w_period.pdf")
                                                                                           #par(cex=0.3)
                                                                                           plot(dendrapply(as.dendrogram(clusters), labelCol))
                                                                                           dev.off()
                                                                                           
                                                                                           write.csv(all_pairs_matrix, "../data/all_pairs_matrix.csv")
                                                                                           
                                                                                           write.csv(all_pairs, "../data/all_pairs.csv")