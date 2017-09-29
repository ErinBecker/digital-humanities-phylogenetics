Three possible articles:
1) Popular opinion piece about "10 Simple Rules for Interdisciplinary Collaboration"  
  - put together draft
  - get contributions/input from SWC/DC, BIDS, etc communities
2) Targeted towards data science-type journal  
  - Feedback from Fernando and others in the Jupyter Project
  - Problems / opportunities with collaborating across languages (R and Python)
  - Problems / opportunities with version controling Jupyter Notebooks
3) Targeted towards Assyriology journal  
  - Concepts for background:
    - synteny
    - distance trees / phylogenies
    - section definitions / kmers
    - 
    
Analyses to do and/or clean up:
- Section definitions
  - Automated based on entry proximity. How does this influence later results? 
  - Test how well our analyses perform on other corpuses beyond Q39. 
  - Formal analysis of how the section definition performed across different Q texts.
  - Compare the results of the "entry proximity" vs "composite text" methods for defining sections.
- Order of entries within sections
  - apply synteny approach. Are there any changes in how this is implemented?
  - add "top" and "bottom" sections
 - Heatmaps for mapping sections across documents  
    - use as a way of describing the data. Section rarity, popularity. Size of sections, etc. 
~~ - Grouping documents by entry similarity (DTM)
    - Check results, clean up notebook  
    - Revisualize tree  
    - Add proveniance and period ~~
 - Checks of our methods:
    - Metadata (do docs from the same site/period co-branch)?
    - Making a artificial set of exemplars to test our methods on, for which similarity/relationship is known.
 - What is the effect of text length on methods? 
  
  
  Benchmarks/Timeline:      
  - Friday 10/6
    - Erin: 
      - Read about hierarchical clustering algorithms and see which is appropriate for our data
      - Talk to Gabe about hierarchical clustering
      - Implement that hclust method and sanity check ordering and branch lengths (for dtm analysis)
      - Update section presence/absence dendrograms based on hclust research and be prepared to discuss at our next meeting
    - Niek: 
      - Read about hierarchical clustering algorithms and see which is appropriate for our data
      - talk to Cody Hennesy about HathiTrust conference
    - Together: 
      - Go through dendrograms in detail. Figure out what worked / didn't work and make detailed plan for follow-up analyses.
  - Friday 10/13
    - Erin: 
      - Work on filling in outline for the 10 simple rules paper. 
      - Solidify which analyses to do /complete/ include in paper and add to outline.
    - Niek:
  - Wednesday 10/18
    - Erin: 
    - Niek:
  - Friday 10/27
    - Erin: 
    - Niek:
      

