# Build UPGMA and neighbor joining trees
for(i in 1:2) {
  filename_in = paste0("data/dtm_data/bootstrap/distance_matrices/all_pairs_", i, ".csv")
  filename_out = paste0("data/dtm_data/bootstrap/trees/dtm_nj_", i, ".tre")
  all_pairs = read.csv(filename_in, row.names = 1)
  all_pairs_matrix = data.matrix(acast(all_pairs, doc1 ~ doc2, 
                                       value.var='distance', fun.aggregate = sum, margins = FALSE))
  treeNJ  <- NJ(dist(all_pairs_matrix))
  write.tree(treeNJ, filename_out)
}
