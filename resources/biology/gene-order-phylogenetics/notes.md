1) Inferring phylogenetic networks from gene order data (2013)  
- "all genomes in the dataset should contain the same set of markers"  
- order of these marker genes is represented as a sequence of signed numbers with absolute values being identifiers of elements and a sign denoting direction  
- phylogenetic networks = nontree graphs describing evolutinary relationships  
- this approach generates phylogenetic network, basically a complicated tree with many paralel branches of different weights  

2) Ordered orthology as a tool in prokaryotic evolutionary inference (2016)  
- focuses on loss of synteny (i.e. loss of conserved gene order)  
Check out:   
- Gene order comparisons for phylogenetic inference: evolution of the mitochondrial genome (Sanko, 1992)  
- Edit distance for genome comparison based on non-local operations (Sanko, 1992)

- k-neighborhood = set of genes at distance at most k from a gene along the genome  
- synteny index (SI) is the number of common genes in the k neighborhoods of this gene across the genomes being compared  
- if a gene is present in only one genome, its SI is zero (ie SI is defined only for genes that coexist between two genomes)
- genome wide SI = average of SI for all genes in the genomes
- ?? How is SI calculated for genes within k of the end of a genome??
- Distance = 1 - genome wide SI for any pair of genomes