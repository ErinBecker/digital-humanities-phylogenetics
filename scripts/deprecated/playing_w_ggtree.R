## Just testing out ggtree for tree visualization

setwd("Box Sync/digital-humanities-phylogenetics/data/section_SI/bootstrap/consensus_trees/")

library(ggtree)
# documentation: https://guangchuangyu.github.io/ggtree/documentation/

tree = read.tree("mcc_tree.tre")

ggtree(tree)

ggtree(tree, color = "firebrick", size = 1, linetype = "dotted")

ggtree(tree, ladderize=FALSE)

# for a cladogram
ggtree(tree, branch.length="none")

# to scale branch lengths (this doesn't do what I expected)
ggtree(tree, branch.length=0.5)
ggtree(tree, branch.length=30)

ggtree(tree, layout = "rectangular") # default
ggtree(tree, layout = "slanted")
ggtree(tree, layout = "fan")
ggtree(tree, layout = "circular")
ggtree(tree, layout = "radial")
ggtree(tree, layout = "equal_angle")
ggtree(tree, layout = "daylight")
ggtree(tree, layout = "unrooted")

# adding title
ggtree(tree) + ggtitle("(Phylogram) rectangular layout")
ggtree(tree, layout="unrooted") + ggtitle("unrooted layout")

# adding scale
ggtree(tree) + theme_tree2()
ggtree(tree) + geom_treescale(width = 3, 
                              color='red', offset = 1,
                              fontsize = 4)
# adding stuff to tips
ggtree(tree) + geom_tippoint(color="#FDAC4F", shape=8, size=3)
# we can do different types of stuff to certain tips
# eg age or location

# adding labels
ggtree(tree) + geom_tiplab(size=3, color="purple")

# we can move the labels
ggtree(tree) + geom_tiplab(aes(x=branch), size=3, color="purple", vjust=-0.3)


# we can do fancy things with backgrounds and stuff
multiplot(
  ggtree(tree, color="red") + theme_tree("steelblue"),
  ggtree(tree, color="white") + theme_tree("black"),
  ncol=2)

# we can zoom in on part of the tree
library("ape")
data(chiroptera)
gzoom(chiroptera, grep("Nyctimene", chiroptera$tip.label))
gzoom(chiroptera, grep("Myotis", chiroptera$tip.label))

gzoom(tree, grep("Q", tree$tip.labl)) 
# this would be cooler if we had a big tree, it's 
# actually REALLY awesome!!

# coloring the tree
# using aes(color=VAR) 
# to map the color of tree based on a specific variable 
# (numeric and category are both supported).


