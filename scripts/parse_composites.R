# separate data from composites.csv into one csv for each composite text
composites = read.csv(file = "composites.csv", stringsAsFactors = FALSE)
composites$X = NULL
composites$document = gsub("(.*)\\..*", "\\1", composites$id_line)
composites$entry = composites$lemma
composites$entry = gsub(" ", "_", composites$entry) #replace spaces with underscore
unique_docs = unique(composites$document)
sapply(unique_docs, function(x) {
  lines = which(composites$document == x)
  write.csv(composites[lines,], file = paste0(x, ".csv"), quote = FALSE, row.names = FALSE)
})