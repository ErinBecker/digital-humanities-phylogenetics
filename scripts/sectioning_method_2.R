# Use getLongestCommonSubstring() from Rlibstree
# source("http://bioconductor.org/biocLite.R")
# biocLite("Rlibstree")

# Needs bioconductor and having difficulty installing on Jupyter notebook
# Want to test and make sure it works before I go through all the trouble

setwd("~/Box Sync/digital-humanities-phylogenetics/data/composite_texts/")

library(Rlibstree)

## separate data from composites.csv into one csv for each composite text
# composites = read.csv(file = "composites.csv", stringsAsFactors = FALSE)
# composites$X = NULL
# composites$document = gsub("(.*)\\..*", "\\1", composites$id_line)
# composites$entry = composites$lemma
# composites$entry = gsub(" ", "_", composites$entry) #replace spaces with underscore
# unique_docs = unique(composites$document)
# sapply(unique_docs, function(x) {
#   lines = which(composites$document == x)
#   write.csv(composites[lines,], file = paste0(x, ".csv"), quote = FALSE, row.names = FALSE)
# })

## Functions
get_guidewords = function(line) {
  # extract all guidewords for a line into character vector
  line = unlist(strsplit(line, "_"))
  line = gsub(".*\\[", "", line)
  line = gsub("\\].*", "", line)
  guidewords = line
  guidewords
}

get_citation_forms = function(line) {
  line = unlist(strsplit(line, "_"))
  line = gsub("(.*)\\[.*", "\\1", line)
  citation_form = line
  citation_form
}

def_section_breaks = function(df_kmers, cutoff) {
  # cutoff is minimum length of kmer defining a real section
  df_kmers$section = NA
  first_section_start = which(df_kmers$k >= cutoff)[1]
  df_kmers$section[first_section_start] = TRUE
  for (i in first_section_start:nrow(df_kmers)) {
    if (df_kmers$k[i] >= cutoff) { df_kmers$section[i] = TRUE}
    else (df_kmers$section[i] = FALSE)
  }
  df_kmers
}

clean_kmer = function(x) {
  # get rid of part of speech (follows each ])
  x = gsub("(\\])[a-zA-Z/]*_", paste0("\\1", "_"), x) #for all but last word
  x = gsub("(_.*\\])[a-zA-Z/]*", "\\1", x) #for last word
  
  # get rid of punctuation (but only {}[]_.)
  x = gsub("\\]", "", x)
  x = gsub("\\[", "", x)
  x = gsub("\\{", "", x)
  x = gsub("\\}", "", x)
  x = gsub("_", "", x)
  x = gsub("\\.", "", x)
  x
}

create_kmers_df = function(file, cutoff) {
  df_composite = read.csv(file, stringsAsFactors = FALSE)
  # initialize empty data frame for storing results
  df_kmers = data.frame(line_a = character(nrow(df_composite)), 
                        line_b = character(nrow(df_composite)),
                        kmer = character(nrow(df_composite)),
                        k = numeric(nrow(df_composite)),
                        stringsAsFactors = FALSE)
  
  for (i in 1:nrow(df_composite) - 1) {
    line_a = tolower(df_composite$entry[i])
    guidewords_a = get_guidewords(line_a)
    citation_form_a = get_citation_forms(line_a)
    
    line_b = tolower(df_composite$entry[i + 1])
    guidewords_b = get_guidewords(line_b)
    citation_form_b = get_citation_forms(line_b)
    
    line_a_clean = clean_kmer(line_a)
    line_b_clean = clean_kmer(line_b)
    kmer = getLongestCommonSubstring(c(line_a_clean, line_b_clean))
    kmer = gsub("[\x80-\xFF]", "", kmer) # get rid of multibyte strings introduced by Rlibstree
    k = nchar(kmer)
    
    # #if there is any whole word overlap and k < cutoff, set k to length of cutoff
    # if (k < cutoff) {
    #   if (sum(citation_form_a %in% citation_form_b) + sum(guidewords_a %in% guidewords_b) > 0) {
    #     k = cutoff
    #   }
    #   if (sum(citation_form_a %in% citation_form_b) + sum(guidewords_a %in% guidewords_b) == 0) {
    #     k = k
    #   } }
      
    df_kmers$line_a[i] = line_a
    df_kmers$line_b[i] = line_b
    df_kmers$kmer[i] = kmer
    df_kmers$k[i] = k
#    df_kmers = def_section_breaks(df_kmers, cutoff)
  }
  
  plot(df_kmers$k, type = "l")
  plot(df_kmers$k, pch = ".")
  df_kmers
  
}

Q1 = create_kmers_df("Q000001.csv", cutoff = 3)
# Q39 = create_kmers_df("Q000039.csv")
# Q40 = create_kmers_df("Q000040.csv")
# Q41 = create_kmers_df("Q000041.csv")
# Q42 = create_kmers_df("Q000042.csv")


# add_section_numbers = function(df_kmers) {
#   df_kmers$sect_num = NA
#   counter = 1
#   for(i in nrow(df_kmers)) {
#     if(df_kmers$section[i] == FALSE) { counter = counter + 1 }
#     
#   }
# }


# Things to check:

# 1) There are two lines in the composite text which represent 
# missing lines. This seems strange to me. 
# which(df_composite$entry == "")

# 2) getLongestCommonSubstring sticks a seemingly random additional
# character onto the end of the uncovered string.
# sometimes these characters are multibyte strings and can't be
# handled by nchar
# (mostly) Fixed this by gsubing out multibyte characters
# View(df_kmers[which(df_kmers$kmer != df_kmers$kmer2),])

#3) Even after fixing #2, kmer length is not reproducible
# running the code that creates df_kmers multiple times 
# produces slight differences
# look into this

#6) take out "nana" kmers

#7) due to ordering, longest substring is sometimes 0 (because taking out punct and part of speech is after kmer)
# this ordering is probably a problem - sometimes kmer is eg "v/i"
