# Created 10/17/17 
# by Erin Becker

# Steps
# 1. Generate new DTMs by bootstrapping existing DTM 
# 2. Create distance matrices based on those new DTMS
# 3. Create trees from the new distance matrixes
# 4. Use consensus tree or similar program to add bootstrap values to tree

setwd("~/Box Sync/digital-humanities-phylogenetics/")

# Read in cleaned DTM
dtm_df = read.csv("data/dtm_data/dtm_df_clean.csv", stringsAsFactors = F, row.names = 1) 

# Generate new DTMs by bootstrapping existing DTM 
for(i in 1:1000) {
  filename = paste0("data/dtm_data/bootstrap/dtms/dtm_df_", i, ".csv")
  dtm_bootstrap = sample(dtm_df, replace = TRUE)
  write.csv(dtm_bootstrap, filename)
}





