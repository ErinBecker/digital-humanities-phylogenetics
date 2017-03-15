# Use getLongestCommonSubstring() from Rlibstree
# source("http://bioconductor.org/biocLite.R")
# biocLite("Rlibstree")

# Needs bioconductor and having difficulty installing on Jupyter notebook
# Want to test and make sure it works before I go through all the trouble

setwd("~/Box Sync/digital-humanities-phylogenetics/data/composite_texts/")

library(Rlibstree)

# separate data from composites.csv into one csv for each composite text
composites = read.csv(file = "composites.csv", stringsAsFactors = FALSE)
composites$X = NULL
composites$document = gsub("(.*)\\..*", "\\1", composites$id_line)
unique_docs = unique(composites$document)
sapply(unique_docs, function(x) {
  lines = which(composites$document == x)
  write.csv(composites[lines,], file = paste0(x, ".csv"), quote = FALSE, row.names = FALSE)
})


df_composite = read.csv(file = "Q000039.csv", stringsAsFactors = FALSE)
# still need to remove rows representing missing lines

df_kmers = data.frame(line_a = character(nrow(df_composite)), 
                      line_b = character(nrow(df_composite)),
                      kmer = character(nrow(df_composite)),
                      kmer2 = character(nrow(df_composite)),
                      kmer3 = character(nrow(df_composite)),
                      k = numeric(nrow(df_composite)),
                      stringsAsFactors=FALSE)

for(i in 1:nrow(df_composite)) {
  line_a = tolower(df_composite$entry[i])
  line_b = tolower(df_composite$entry[i +1])
  kmer = getLongestCommonSubstring(c(line_a, line_b))
  kmer2 = gsub("[\x80-\xFF]", "", kmer)  # what other special characters?
  kmer3 = gsub("\\]", "", kmer2) # get rid of punctuation (but only {}[]_.)
  kmer3 = gsub("\\[", "", kmer3)
  kmer3 = gsub("\\{", "", kmer3)
  kmer3 = gsub("\\}", "", kmer3)
  kmer3 = gsub("_", "", kmer3)
  kmer3 = gsub("\\.", "", kmer3)
  k = nchar(kmer3)
  df_kmers$line_a[i] = line_a
  df_kmers$line_b[i] = line_b
  df_kmers$kmer[i] = kmer
  df_kmers$kmer2[i] = kmer2
  df_kmers$kmer3[i] = kmer3
  df_kmers$k[i] = k
  df_kmers
}

plot(df_kmers$k, type = "l")
plot(df_kmers$k, pch = ".")

# Get changepoints to determine section breaks
# install.packages("changepoint")
# library(changepoint)

# section_boundaries = cpt.var(df_kmers$k, penalty = "None",
#                              Q = 20)

# Things to check:

# 1) There are two lines in the composite text which represent 
# missing lines. This seems strange to me. 
# which(df_composite$entry == "")

# 2) getLongestCommonSubstring sticks a seemingly random additional
# character onto the end of the uncovered string.
# sometimes these characters are multibyte strings and can't be
# handled by nchar
# Fixed this by gsubing out multibyte characters
# View(df_kmers[which(df_kmers$kmer != df_kmers$kmer2),])

#3) Even after fixing #2, kmer length is not reproducible
# running the code that creates df_kmers multiple times 
# produces slight differences
# look into this

#4) Remove punctuation and set cutoff to 3 (anything below 3 is a section break)
#5) If entire guide word (between []) or the entire citation form (everything before [) matches, keep as part of section
#6) take out "nana" kmers
#7) take out part of speech?

