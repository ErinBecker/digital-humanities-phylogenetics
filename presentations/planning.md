### Present at BIDS in early November  

Three topics of focus:  
1) Interdisciplinary collaboration  
2) Collaborating across languages and platforms
3) Results of analyses  

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
 - Grouping documents by entry similarity (DTM)
    - Check results, clean up notebook  
    - Revisualize tree  
    - Add proveniance and period 
 - Checks of our methods:
    - Metadata (do docs from the same site/period co-branch)?
    - Making a artificial set of exemplars to test our methods on, for which similarity/relationship is known.
 - What is the effect of text length on methods? 
  
  
  Benchmarks/Timeline:
  - Wednesday 7/12  
    Erin:   
    - ~~Figure out why max is lower than it should be in SI calcs.~~  
    - ~~Calculate maximum SI for any given k and use that to define distance measure.~~
    - ~~Kick out texts that have only 1 section.~~
    - Make the distance trees.  
    Niek:   
    - ~~Add provenience and period metadata for Erin to pull into analyses.~~
    - ~~Provide outliers (non-related texts).~~ 
    - ~~Outline Assyriology article.~~
    
  - Tuesday 7/18  
    Together:  
    ~~- Before Tuesday each read three [Ten Simple Rules](http://collections.plos.org/ten-simple-rules) articles.~~
    ~~- Outline "Ten Simple Rules for Interdisciplinary Collaboration"~~
    - ~~Plan of attack for proximity based section defintion method.~~
    - ~~Discuss outline of Assyriology article~~
    - 
    
  - Friday 7/28  
    Erin:   
      - Debug notebook for building trees based on SI.
      - Clean up DTM notebook, document and test. 
    Niek:  
      - Outline BIDS talk.
    Together:   
      - Plan next few weeks of work. 
      
   
      
      
Start implementing the entry proximity method for section definition. 

