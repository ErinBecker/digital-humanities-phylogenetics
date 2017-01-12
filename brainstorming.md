# Brainstorming  

Just a braindump for now - needs organization and elaboration.  

## Potentially interesting (or uninteresting) questions/projects  
- Can distance analysis of these texts enable provenancing of unprovenanced texts?  
- Can unlematized texts be lematized using a neural network? 
- How have lexical texts changed over time?  
- Unifying different online collections by going through the sign level (unambiguous mapping)


## Areas of analogy between textual analysis and phylogenetics  
- Gaps in assemblies from metagenomic sampling --> broken tablets, can't know whether a list item is missing or just not in the part of the 
record that was intact.  
- Types of changes: insertions, deletions, reordering  
  Any distance analysis will require putting weights on these different types of changes, which requires understanding the mechanisms by 
  which these changes happen, which are more likely than others, ...  
- Presence/absence metrics

## Some notes  
Transliteration maps unambiguously to original text, but text does not unambiguously map to transliteration. The text-to-transliteration mapping is complicated by:   
- phonetic system used by scholar: some will distinguish between /g/ and /ŋ/; others will represent both by g
- unclear word boundaries: reading udu babbar or udu-babbar ("white sheep" vs "white-sheep")
- signs having different legitimate readings (e.g. one sign can be read as izi "fire", šeŋ₆ "to cook", kum₂ "to be hot" or as the syllable -ne-).  

Textual transmission is not strictly vertical. A new copy of a text can be influenced by multiple variants that are in existance and
available to the scribe. A new text can also be influenced by oral traditions - so even if a scribe doesn't have access to a particular 
physical text, they can still be influenced by it through oral transmission. 

Need to explore existing text analysis algorithims, eg spelling correction algorithims for autocorrect (how many changes do I need to make
to get a recognizable word?) These features may also exist in phylogenetic algorithims (e.g. fuzzy matching), but may not or may need 
different parameters.

## About transliteration:
Index numbers distinguish between homphones. The system has a long history and is far from consistent. It does, however, allow one to identify which signs were used in the original text.

&#12000; sign name A; may be read a = water or duru₅ = wet; or can be used as the syllable -a-.
