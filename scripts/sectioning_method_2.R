# Use getLongestCommonSubstring() from Rlibstree
# source("http://bioconductor.org/biocLite.R")
# biocLite("Rlibstree")

# Needs bioconductor and having difficulty installing on Jupyter notebook
# Want to test and make sure it works before I go through all the trouble

setwd("/Users/ebecker/Box Sync/digital-humanities-phylogenetics/data/composite_texts/")

library(Rlibstree)

## Functions
get_guidewords = function(line) {
  # extract all guidewords for an entry into character vector
  line = unlist(strsplit(line, "_"))
  line = gsub(".*\\[", "", line)
  line = gsub("\\].*", "", line)
  guidewords = line
  guidewords = guidewords[which(guidewords != "na")]
  guidewords
}

get_citation_forms = function(line) {
  # extract all citation forms for an entry into character vector
  line = unlist(strsplit(line, "_"))
  line = gsub("(.*)\\[.*", "\\1", line)
  citation_form = line
  citation_form = citation_form[which(citation_form != "na")]
  citation_form
}

def_section_breaks = function(df, cutoff) {
  # cutoff is minimum length of kmer defining a real section
  df$section = NA
  first_section_start = which(df$k >= cutoff)[1]
  df$section[first_section_start] = TRUE
  for (i in first_section_start:nrow(df)) {
    if (df$k[i] >= cutoff) { df$section[i] = TRUE}
    else (df$section[i] = FALSE)
  }
  df
}

clean_kmer = function(x) {
  # get rid of part of speech (follows each ])
#  x = gsub("(\\])[a-zA-Z/]*_", paste0("\\1", "_"), x) #for all but last word
  x = gsub("(\\])[a-zA-Z/]*", "\\1", x) #for all but last word
#  x = gsub("(_.*\\])[a-zA-Z/]*", "\\1", x) #for last word
  
  # get rid of punctuation (but only {}[]_.)
  x = gsub("\\]", "", x)
  x = gsub("\\[", "", x)
  x = gsub("\\{", "", x)
  x = gsub("\\}", "", x)
  x = gsub("_", "", x)
  x = gsub("\\.", "", x)
  x
}

compare_entries = function(file) {
  df_composite = read.csv(file, stringsAsFactors = FALSE)
  # remove lines in df representing missing lines or sections
  empty_lines = which(df_composite$entry == "")
  if (length(empty_lines) != 0) {df_composite = df_composite[-empty_lines,] }
  
  # initialize empty data frame for storing results
  num_rows = nrow(df_composite) - 1
  df_compare = data.frame(line_a = character(num_rows), 
                          line_b = character(num_rows),
                          overlap = numeric(num_rows),
                          kmer = character(num_rows),
                          k = numeric(num_rows),
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
    
    overlap = sum(citation_form_a %in% citation_form_b) + sum(guidewords_a %in% guidewords_b)
    
    df_compare$line_a[i] = line_a
    df_compare$line_b[i] = line_b
    df_compare$overlap[i] = overlap
    df_compare$kmer[i] = kmer
    df_compare$k[i] = k
  }
  plot(df_compare$overlap, pch = ".")
  df_compare
}


#######

Q1 = compare_entries("Q000001.csv")
Q39 = compare_entries("Q000039.csv")
# Q40 = compare_entries("Q000040.csv")
# Q41 = compare_entries("Q000041.csv")
# Q42 = compare_entries("Q000042.csv")


# add_section_numbers = function(df_kmers) {
#   df_kmers$sect_num = NA
#   counter = 1
#   for(i in nrow(df_kmers)) {
#     if(df_kmers$section[i] == FALSE) { counter = counter + 1 }
#     
#   }
# }


# Things to check:

# kmer length is not reproducible
# Best to do kmer matching after spliting English and Sumerian (not allow matching over language boundaries)
