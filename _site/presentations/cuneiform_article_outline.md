# Lists of Trees and Tree Diagrams: Computational Biology and the History of the List of Trees and Wooden Objects
By Erin Becker and Niek Veldhuis
## 1 Introduction
### 1.1 Versions of lexical lists in OB and MB
- factor **temporal** distance
- factor **geographical** distance
- temporal and geographical distance are related to **textual** distance which can be expressed computationally.

Is it possible to create a **measure** of textual distance that might indicate geographical or temporal distance/proximity?

Is it possible to use such distances for creating a **dendrogram**, illustrating the complex interdependencies?

### 1.2 Phylogenetics
- measuring distance between genes
- using distance measurements for building a phylogenetic tree
- strong and weak aspects of the analogy
    - strong: lists; changes over time
    - weak: evolution of lexical texts is not linear

### 1.3 Previous research
Instances where researches have suggested genetic connections between lexical texts based on similarity.
* [BRM 29 + 30](http://oracc.org/dcclt/P250364) from Ur? (diss. Niek)
* [KM 89542](http://oracc.org/dcclt/P235262) text from Isin? (diss. Niek)
* Nuzi text related to Emar (M. Civil) (text still needs lemmatization!)
* [MB Nippur](http://oracc.org/dcclt/P247850) text related to Emar (Peterson)
* The rare words **negipum** and **katapum** (both referring to a type of ceremonial weapon) appear together in 4 [exemplars](http://oracc.org/dcclt/P247864,P273880,P388265,P347814). Are these texts connected?
* the rare spelling {ŋeš}še₃-še₃ appears in [Isin](http://oracc.org/dcclt/P459217,P459216) lexical texts and in [FLP 1168](http://oracc.org/dcclt/P459784). Is the FLP text from Isin?

Lessons learned:
- for **longer** texts: order of **sections** may be strong indicator of connection
- for **shorter** texts (Civil, Peterson) order of **items** is useful
- **rare** items or sections are stronger indicators than common ones
> [dcclt/P272557](http://oracc.org/dcclt/P272557) and [dcclt/P388082](http://oracc.org/dcclt/P388082) are identical 3-line texts. Related or coincidence? Contain rare entries.
- **spelling** of items may occasionally be of interest (also look into spelling traditions of Ugarit/Emar)

### 1.4 Reproducibility: Jupyter Notebooks
- principles of open code (Jupyter Notebooks) and open data (ORACC).
- brief instructions for where to find the notebooks and how to run them.

## 2 Acquiring and Structuring Data
- something about ORACC, JSON
- compare lemmas, not forms (abstract from spelling and morphology)
- compare entries (not words)
- include broken lines (skip variable)
- data set: Old Babylonian and Middle Babylonian lists of trees and wooden objects
- outliers as test

## 3 Analysis 1: Document Term Matrix: Presence/Absence of Entries
- distance measurements based on absence/presence of entries
- problem of breakage, extracts vs. true absence
- tree diagram

## 4 Analysis 2: Section Order
- conceptualizing and instrumentalizing sections
    - overlap and identity in lemmas
    - overlap and identity in guidewords
    - remaining entries
    - kmer
- comparing section order
    - Synteny Index
    - problem: lexical texts are not circular
    - problem: section appearing multiple times
- tree diagram

## 5 Analysis 3: Entry Order within Sections
- conceptualization and instrumentalization
- comparing entry order
- tree diagram

## 6 Analysis 4: Comparing the Tree Diagrams
- strength and weaknesses of the various analyses
- overlap and contradictions

## 7 Conclusions
- about interdisciplinary cooperation and the promise of Data Science
- about open code/open data
- about lexical traditions
