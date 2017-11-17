Order of analyses in manuscript:
1) Grouping documents by shared entry composition (DTM)
    - [X] Move to Rmd 
    - [X] Clean up code  
    - [X] Clean up explanatory text  
    - [X] Bootstrap  
    - [X] Build consensus tree  
    - [ ] Hyperlink documents in tree (?)  
    - [ ] Convert tree to phylogram  
    - [ ] Add bootstrap support values to tree nodes  

2) Grouping documents by section similarity  

a) Defining sections based on composite text  
- [X] Move to Rmd
- [X] Clean up code
- [X] Clean up explanatory text
- [X] Remove garbage sections?

i) Grouping documents by shared section composition  
- [X] Move to Rmd   
- [X] Clean up code  
- [X] Deal with kmers crossing language boundaries. 
- [ ] Clean up explanatory text  
- [ ] Bootstrap  (by sampling rows from Q39_par)
- [ ] Build consensus tree  
- [ ] Hyperlink documents in tree (?)  
- [ ] Convert tree to phylogram  
- [ ] Add bootstrap support values to tree nodes  

ii) Grouping documents by section order  
- [ ] Move to Rmd   
- [ ] Add "top" and "bottom" sections  
- [ ] Clean up code  
- [ ] Clean up explanatory text  
- [ ] Bootstrap  
- [ ] Build consensus tree  
- [ ] Hyperlink documents in tree (?)  
- [ ] Convert tree to phylogram  
- [ ] Add bootstrap support values to tree nodes  

d) Defining sections based on entry proximity across corpus  
i) Grouping documents by shared section composition  
- [ ] Write code   
- [ ] Write explanatory text  
- [ ] Bootstrap  
- [ ] Build consensus tree  
- [ ] Hyperlink documents in tree (?)  
- [ ] Convert tree to phylogram  
- [ ] Add bootstrap support values to tree nodes  

ii) Grouping documents by section order  
- [ ] Write code  
- [ ] Write explanatory text  
- [ ] Bootstrap  
- [ ] Build consensus tree  
- [ ] Hyperlink documents in tree (?)  
- [ ] Convert tree to phylogram  
 - [ ] Add bootstrap support values to tree nodes  

3) Quality testing
    a) Agreement among methods for Q39 corpus.  
    b) Agreement among methods for other corpuses.  
    c) Quality of section definitions for Q39 corpus.  
    d) Quality of section definitions for other corpuses.  
    e) Agreement with previous hypothesis and known relationships.  
    f) Effect of text length on results and quality of results.    
  
Benchmarks/Timeline:      
- Friday 11/3
  - Erin 
    - [ ] clean up the section presence/absence code, move to R markdown, and bookstrap
    - [ ] look into changing trees from cladograms to dendrograms
    - [ ] look into adding bootstrap support values to trees (from existing calculations)
  - Niek
    - [X] look at existing trees for dtm analysis and make notes about relationships / interpretation


Other
### To Do (section order):
- (For efficiency) get rid of self-self comparisons and duplicate pairs in all_pairs_SI df.
- Calculate maximum SI for any given k and use that to define distance measure (this depends on document length).
- Incorporate "top" and "bottom" of documents where known.
- Implement Niek's method for comparing sections that appear multiple times within a document. 
- Exclude sections that are "garbage" sections (X.1, X.2). (But check that these are garbage first.)
- Incorporate items from Q text that were not assigned to sections - add these to the section preceding the item.
- Make the distance trees. 
- Incorporate provenience and period in output. 
- Fix issue that very short documents (eg 2 sections) have low self-self SI.
      

