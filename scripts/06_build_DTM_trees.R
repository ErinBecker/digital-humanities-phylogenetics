setwd("~/Box Sync/digital-humanities-phylogenetics/")

all_pairs_matrix2 = read.csv("data/all_pairs_matrix2.csv", row.names = 1)

#source("http://bioconductor.org/biocLite.R")
#biocLite("BiocInstaller")
#biocLite("phangorn")

library("phangorn")

# Build UPGMA and neighbor joining trees
treeUPGMA <- upgma(dist(all_pairs_matrix2))
treeNJ  <- NJ(dist(all_pairs_matrix2))
plot(treeUPGMA, main="UPGMA")
plot(treeNJ, main = "Neighbor Joining")

write.tree(treeUPGMA, "data/trees/dtm_upgma.tre")
write.tree(treeNJ, "data/trees/dtm_nj.tre")
