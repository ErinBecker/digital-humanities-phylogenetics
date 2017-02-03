## Continuation of DTM analysis in R. Moved to RStudio due to issues with running R magic in 
## Jupyter notebook. I promise to convert back to notebook format!!

## Load in DTM data frame.
setwd("Box Sync/digital-humanities-phylogenetics/data")
dtm_df = read.table("dtm_df.csv", sep = ",", header = TRUE, row.names = 1)

## We need to know how sparse the DTM is. 
## How often does each entry appear in the entire collection of documents?
## How frequently do entries re-occur across documents?

dtm_df$num_entries = rowSums(dtm_df)
dtm_df["num_occurances",] = colSums(dtm_df)
dtm_df["num_occurances","num_entries"] = NA 

plot(density(dtm_df$num_entries, na.rm = TRUE))
table(dtm_df$num_entries) #number of documents with each number of entries

length(which(dtm_df$num_entries >= 10))
length(which(dtm_df$num_entries >= 100))

## Only 29 documents have 10 or more entries. Ten documents have greater than 100 entries.

## How frequently do entries re-occur across documents?
entry_frequency = unlist(dtm_df["num_occurances",])

plot(density(entry_frequency, na.rm = TRUE))
common_entries = entry_frequency[which(entry_frequency >= 10)]
length(common_entries)
# 37 entries appear ten or more times across all documents
summary(entry_frequency)

## Some exploratory analysis
## Note that some entries DO appear more than once in a single document,
## (eg. dcclt/P370399 ŋešnimbar.palm.n)
## so we need to convert dtm_df to presence/absence for the following to work.

dtm_df = read.table("dtm_df.csv", sep = ",", header = TRUE, row.names = 1)
# currently "variables" (entries) are sorted alphabetically, would like sorted by frequency
dtm_df = dtm_df[,order(colSums(dtm_df), decreasing = TRUE)]
dtm_df$document = row.names(dtm_df)

library(reshape)
melted_dtm_df = melt(dtm_df)
for(row in 1:nrow(melted_dtm_df)) {
  if(melted_dtm_df$value[row] >= 1) melted_dtm_df$value_bin[row] = 1
  else melted_dtm_df$value_bin[row] = melted_dtm_df$value[row]
}

# This also works, I think, to convert to binary presence/absence data.
# as.matrix((melted_dtm_df > 0) + 0)

# http://stackoverflow.com/questions/10397183/heat-map-of-binary-data-using-r-or-python
library(ggplot2)
# ggplot(data = melted_dtm_df[150000:160474,], aes(y=document, x=variable, fill=value)) + 
#   geom_tile() +
#   theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 5))

qplot(data=melted_dtm_df, x=variable,y=document, fill=factor(value_bin),
    geom="tile")+scale_fill_manual(values=c("0"="lightblue", "1"="red")) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 1), axis.text.y = element_text(size = 3))

qplot(data=melted_dtm_df[1:100,], x=variable,y=document, fill=factor(value_bin),
      geom="tile")+scale_fill_manual(values=c("0"="lightblue", "1"="red")) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 5), axis.text.y = element_text(size = 5))

## Currently sorted by frequency of entries, not #documents entries in
## ŋešnimbar.palm.n is found 93 times across corpus, but in only 8 documents!

