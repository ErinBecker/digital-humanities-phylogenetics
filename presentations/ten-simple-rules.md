## Ten Simple Rules for Collaborating with Jupyter Notebooks

### Introduction

- Benefits of using Jupyter Notebooks
    - cross-language compatibility makes it possible to collaborate across language proficiencies
    - report-layout makes it easy to combine analysis, results and discussion - ease of entry for collaborators unfamiliar to coding
    - widely used, lots of resources for help, great documentation, friendly community
    - active development, new features being added regularly
    
 - Intended audience
 
 - Who we are?

### Rule 1: Use the Right Kernel
- What is a kernel and why do I care?
- Ability to collaborate with people who speak a different (computing) language than you.
- Originally, iPython developed for Python only (hence the name), now supports many languages.
-  Many kernels exist (see resources)
- Most commonly used / well supported kernels (at the time of writing) are . . . 
- Possible to combine languages within a single notebook via cell/line magics but we don't recommend it because . . . 
    - Difficulties passing objects back and forth between languages due to differences in formatting. 
        - Missing values 
        - Dataframe formatting weirdness (find the example of this)
    - If using R within a Python notebook, do you need to load libraries in each cell you're using them in, or only in the overall notebook?
    - If you must do this, anticipate difficulties
    - What were some of our problems? How could we solve those?
- Anticipate hidden errors when working outside of Python
    - Working within R kernel posed challenges due to output text not being rendered to Jupyter Notebook cell.
        - When installing packages, R prompts to select a CRAN mirror, but Jupyter simply pops up an input box saying "Selection:"
        - For code that takes a while to run, R often displays intermediate progress messages,but these didn't appear in Jupyter Notebook
          leading to confusion about whether process had stalled or was still running.
        - Installing R packages sometimes timed out the kernel.
- Know where your packages are installing
    - Describe difficulty in terms of what the user experiences as also in terms of what the underlying technical issue is. 
    - Fix is to explicitly specify libpath each time you load a package.

#### Resources:
- [Authoritative list of available kernels](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels)
- 

### Rule 2: Use Version Control, but . . . 
- Use version control but . . .  
  - Avoid Merge Conflicts (or know how to handle them!) - Using Git to manage notebooks is hard
  - Hard to work on the same notebook - how would this be possible? Or is it?
  - similtaneous vs sequential collaboration

### Rule 3: Practice Modularity
- Practice Modularity - when should things go in different notebooks, when in different cells (small cells)?
    - chunk notebooks, each collaborator works on his/her own
    - create intermediate input/output files

### Rule 4: Be Adaptable
- Re-run your notebook (for people used to working with scripts, cell independence can present problems)
- Anticipate differences (between Jupyter Notebooks and the platform you're used to working in)
    - Have adaptable code-writing practices (be willing to change the way you write code to take advantage of functions of Jupyter notebooks)

### Rule 5: Comment Your Code
- Comment your Code (document what you're doing)

### Rule 6: Provide Examples
- Provide examples - when writing functions, show some sample input/output (provide a test case)
    
### Rule 7: Meet Regularly
- Meet in person if possible (or meet regularly in some way)
    - Your mode of working may be different than your collaborators  
    - Why is this important?

### Rule 8: Be Persistent and Seek Help
- Be Persistent  (installing packages, passing data objects between languages)
- Ask Questions  
    
### Conclusion

### Acknowledgements

### References
    
#### Misc
- How do you call a notebook from another GitHub repo?

    


