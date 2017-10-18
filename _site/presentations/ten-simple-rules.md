## Ten Simple Rules for Collaborating with Jupyter Notebooks

### What is The Jupyter Notebook?

The Jupyter Notebook is an open-source coding environment for producing 
interactive documents that combine code, visualizations and explanatory
text. First released in 2011 as a Python-based notebook system (the 
iPython Notebook), the Jupyter Notebook has grown to support a multitude
of programming languages (including **Ju**lia, **Pyt**hon, and **R**, 
on which its name is based), and is widely-used in applications ranging
from collaborative research to scientific reporting to education [add relevant refs].

The potential benefits of using Jupyter Notebook in collaborative 
research efforts are mainfold. First, Jupyter Notebook combines 
interactive execution with a report-based layout, making it easy to
combine analysis, results and discussion in a single document. This
integrated report layout can reduce the entry barrier for collaborators
who may lack familiarity with coding or with the particular software 
being used in the research project. Its interactive nature
makes it easy to quickly view the results of changing a variable or 
including a new dataset. 

The Jupyter Notebook provides an excellent mixture of established 
performance and in-development functionality. Although its central
features are firmly established (and therefore dependable), the Jupyter
Notebook is under active development, with new features being added
regularly and in response to community interest. In later sections
we will provide some examples of developer responsiveness to community
needs that arose during the course of our year-long research project.

When considering adopting any new tool, it is important to take into 
account the availability of resources for trouble-shooting the 
inevitable roadblocks you will encounter. In part because of its
popularity and the friendly community its founders have nurthered, 
there are abundant resources available for Jupyter Notebook in addition
to great documentation [ref to some resources and documentation].

Lastly, we would like to call attention to the multi-language 
compatibility of the Jupyter Notebook. Currently, the Jupyter Notebook
supports over forty programming languages. This has been touted as a 
boon to researchers in making it possible for researchers to collaborate
with others who have different programming language proficiencies or 
preferences. Through our year-long collaboration, we (a Python 
programmer and an R programmer) explored Jupyter Notebook's abilities to
support cross-language collaborations. We will discuss our experiences,
findings, and recommendations in a later section. 

### Intended Audience

### Who Are the Authors?

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
- Accept limitations
    - [Interactive input for R doesn't work, even in R kernel](https://stackoverflow.com/questions/38466438/readline-in-jupyter-irkernel)
- Know where your packages are installing
    - Describe difficulty in terms of what the user experiences as also in terms of what the underlying technical issue is. 
    - Fix is to explicitly specify libpath each time you load a package.
- If you need to update R, you can't just install the new version. Need to https://conda.io/docs/user-guide/tasks/use-r-with-conda.html

#### Resources:
- [Authoritative list of available kernels](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels)
- [Issues with readline](https://github.com/IRkernel/IRkernel/issues/199)
- [More issues with readline](https://github.com/IRkernel/IRkernel/pull/452)

### Rule 2: Use Version Control, but . . . 
- Describe the problem
- How does this cause issues in a "normal" workflow
- Strategies for managing/avoiding merge conflicts for the less technical crowd
    - sequential collaboration
    - modularity
- Strategies for managing merge conflicts for the more technical crowd
    - nbdime (see resources)

#### Resources:
- [Tool for diffing and merging Jupyter Notebooks](http://nbdime.readthedocs.io/en/latest/)
- [History of the conversation about issues with merge conflicts in Jupyter Notebooks](https://github.com/jupyter/nbdime/issues?utf8=%E2%9C%93&q=is%3Aissue%20merge%20conflicts%20)
- [YouTube video presentation of nbdime](https://www.youtube.com/watch?v=tKAmwC8ay8E)
- [More history about the issue](https://stackoverflow.com/questions/18734739/using-ipython-notebooks-under-version-control)

### Rule 3: Practice Modularity
- Practice Modularity - when should things go in different notebooks, when in different cells (small cells)?
    - chunk notebooks, each collaborator works on his/her own
    - create intermediate input/output files
    
#### Resources:
   - [Reusing code between different notebooks](https://stackoverflow.com/questions/16966280/reusing-code-from-different-ipython-notebooks)
   - [Importing notebooks as modules](http://jupyter-notebook.readthedocs.io/en/latest/examples/Notebook/Importing%20Notebooks.html)
   - [Similar info from SciPy lectures](http://www.scipy-lectures.org/intro/language/reusing_code.html)
   - [Relevant Google group discussion](https://groups.google.com/forum/#!topic/jupyter/V2knsyBCUYU)

### Rule 4: Be Adaptable
- Re-run your notebook (for people used to working with scripts, cell independence can present problems)
- Anticipate differences (between Jupyter Notebooks and the platform you're used to working in)
    - Have adaptable code-writing practices (be willing to change the way you write code to take advantage of functions of Jupyter notebooks)
    
#### Resources:
- [R Notebooks vs Jupyter Notebooks](https://www.datacamp.com/community/blog/jupyter-notebook-r#gs.JyqiRr0)
- [Why I Switched from Jupyter Notebooks to R Markdown](http://danielphadley.com/Jupyter-to-Rmarkdown/)

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
- Should we mention R Notebooks somewhere as a valid alternative? Do they have cross-language capability? They claim to be easier to diff. ([Comparison of the two](http://minimaxir.com/2017/06/r-notebooks/))
- Is it possible to run a python magic in e.g. an R kernel? (for sidestepping limitations in eg. readline)
- Not all of base r is included in conda install r-essentials? https://support.bioconductor.org/p/99576/

http://blog.fperez.org/2012/01/ipython-notebook-historical.html
