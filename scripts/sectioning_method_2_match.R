# A simplified method that looks for overlap in citation form and/or guideword
# in order to define section boundaries.

setwd("/Users/ebecker/Box Sync/digital-humanities-phylogenetics/data/composite_texts/")

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

compare_entries = function(file) {
  df_composite = read.csv(file, stringsAsFactors = FALSE)
  # remove lines in df representing missing lines or sections
  empty_lines = which(df_composite$entry == "")
  if (length(empty_lines) != 0) {df_composite = df_composite[-empty_lines,] }
  
  # initialize empty data frame for storing results
  num_rows = nrow(df_composite)-1
  df_compare = data.frame(line_a = character(num_rows), 
                        line_b = character(num_rows),
                        overlap = numeric(num_rows),
                        stringsAsFactors = FALSE)
  
  for (i in 1:nrow(df_composite) - 1) {
    line_a = tolower(df_composite$entry[i])
    guidewords_a = get_guidewords(line_a)
    citation_form_a = get_citation_forms(line_a)
    
    line_b = tolower(df_composite$entry[i + 1])
    guidewords_b = get_guidewords(line_b)
    citation_form_b = get_citation_forms(line_b)
    
    overlap = sum(citation_form_a %in% citation_form_b) + sum(guidewords_a %in% guidewords_b)
    
    df_compare$line_a[i] = line_a
    df_compare$line_b[i] = line_b
    df_compare$overlap[i] = overlap
  }
  plot(df_compare$overlap, pch = ".")
  df_compare
}

Q1 = compare_entries("Q000001.csv")
Q39 = compare_entries("Q000039.csv")
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


# Remove part of speech before calculating kmer
