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
- problem becomes how to set k to a reasonable value
- another approach is genome rearrangement (GR) that defines the distance between genomes as the number of operations required to transform one genome to the other (e.g. GRAPPA software).
- GRAPPA is very slow and prohibitive for genome sizes larger than 80 genes.
- Other methods:
    - gene content (GC) - relative number of shared genes is counted
    - directed gene pairs (DP) - counts the relative number of ordered, uninterrupted gene pairs present in both genomes.
    - GC appears to be superior in instances of very high rates of gene loss relative to gain. This doesn't usually happen in nature with genomes, but may more accurately reflect what happens with our documents.  

3) Rearrangement Phylogeny of Genomes in Contig Form (2010)  
- this paper was selected due to it's emphasis on incomplete genomes  
- problem addressed: many genomes are published in contig (fragment) form only. Existing methods for reconstructing evolutionary relationships from gene order information require complete assembled genomes (no gaps or fragments)  
- this method uses contigs directly in gene order algorithms, treating them as chromosomes (ie. treating them as though they represented biologically real fragments rather than computational artifacts) and applies some corrections to the algorithms to deal with biases introduced.  
- 
