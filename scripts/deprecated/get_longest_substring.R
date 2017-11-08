get_longest_kmer_from_set_of_words = function(entry1, entry2, fun) {
  # extract word sets from each entry
  word_set_x = fun(entry1)
  word_set_y = fun(entry2)
  
  # initialize empty vector to store results
  longest = c() 
  
  # loop through each word pair and get longest common substring
  for(word_x in word_set_x) {
    for(word_y in word_set_y) {
      substring = getLongestCommonSubstring(c(word_x, word_y))
      longest = c(longest, gsub("[\x80-\xFF]", "", substring))
    }}
  
  if (length(longest) == 0) {
    kmer = NA
    k = 0 }
  
  else {
  # get longest common substring from any of the possible pairs
  k = max(nchar(longest))[1]
  kmer = longest[which(nchar(longest) == max(nchar(longest)))][1] }
  
  
  # return the k and kmer with names associated with the vector
  return_values = c(k, kmer)
  names(return_values) = c("k", "kmer")
  return(return_values)
}

find_kmer_per_language = function(entry1, entry2, fun1, fun2) {
  
  # extract longest common substring based on different word sets output from fun1 and fun2
  # example fun1 = get_citation_forms, fun2 = get_guidewords
  longest_kmer_x = get_longest_kmer_from_set_of_words(entry1, entry2, fun1)
  longest_kmer_y = get_longest_kmer_from_set_of_words(entry1, entry2, fun2)
  
  # extract the longest kmer from each set of comparisons
  lengths = c(longest_kmer_x["k"], longest_kmer_y["k"])
  names(lengths) = c(longest_kmer_x["kmer"], longest_kmer_y["kmer"])
  
  # return the kmer that is the longest between these two sets
  names(which(lengths == max(as.numeric(lengths))))[1]
}

  