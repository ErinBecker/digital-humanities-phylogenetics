## Ten Simple Rules for Collaborating with Jupyter Notebooks

### What is the Jupyter Notebook?

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
popularity and the friendly community its founders have nurtured, 
there are abundant resources available for Jupyter Notebook in addition
to great documentation [ref to some resources and documentation].

Lastly, we would like to call attention to the multi-language 
compatibility of the Jupyter Notebook. Currently, the Jupyter Notebook
supports over forty programming languages. This has been touted as a 
boon to researchers in making it possible for them to collaborate
with others who have different programming language proficiencies or 
preferences. Through our year-long collaboration, we (a Python 
programmer and an R programmer) explored Jupyter Notebook's abilities to
support cross-language collaborations. We will discuss our experiences,
findings, and recommendations in a later section. 

### Intended Audience

This article is intended for people who are comfortable programming in
one or more scripting languages using either the native interpreter 
or a graphical user interface (GUI) (such as RStudio or [list others])
and are considering adopting the Jupyter Notebook. These ten simple 
rules will also be helpful for current Jupyter Notebook users who want
to expand their use of Jupyter Notebook's many useful features or 
otherwise improve their workflow.

### Who Are the Authors?

We are two computational researchers with different academic
specializations and programmatic preferences. One is a
computational biologist with a background in comparative genomics and 
phylogenetics who has previous experience with Python but does most
of her programming in R. The other is an assyriologist studying the 
history of education and lexicography in ancient Mesopotamia who has 
some experience with R but is more comfortable in Python. In January
2017, we began a research collaboration and adopted the Jupyter 
Notebook primarily for its potential to facilitate cross-language 
collaborations. Throughout our research project, we documented issues
we faced in using the Jupyter Notebook along with strategies we used to
address these issues. We hope that our recommendations will be helpful
for the reader in making effective use of Jupyter Notebook's many 
well-developed capabilities.

### Rule 1: Choose the Right Kernel

The first choice you will face when starting to use Jupyter Notebook is which
kernel is appropriate for your project. A kernel is the program responsible for
running and interpreting the
code that a user enters into the notebook. The Jupyter Notebook ships with the
default IPython kernel,
which enables programming in Python (currently v3.3 and higher). 
The IPython kernel also includes a number of `magic` functions for 
incorporating other programming languages into a single cell of the 
notebook or a single line within a cell. As of this writing, IPython
magic functions support scripting in Bash, Perl, PyPy, and Ruby ([1][magics]). 
IPython can also support line or cell-based R scripting when combined with the 
rpy2 package ([2][rpy2-cite]). If you will be primarily programming in Python, but would appreciate the ability
to incorporate small chunks of another scripting language, it makes sense to use
the default IPython kernel. 

Many other kernels have been developed by the community to support the use of
other programming languages within the Jupyter Notebook interface. Over ninety 
alternative kernels are currenly listed in the Jupyter Notebook documentation
([3][kernels-list]). These kernels have varying levels of developer support. 
Although many are under active development, others have not been updated in years
and are unlikely to be functioning. Before adopting a kernel, 
we strongly recommend researching the project by
reading its latest documentation, checking the last commit date to the project's
GitHub or Bitbucket repository, and searching the kernel name on 
StackOverflow ([4][stackoverflow]) to see common user problems. 

As of this writing, the most commonly used and up-to-date kernels include IJulia, 
IRkernel, IHaskell, IJavascript (?), jpCoffeescript (?), IfSharp, Gophernotes, Jupyter-PHP, IOctave, MATLAB Kernel, CloJupyter, and cling. 


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
- Keep in mind that kernels aside from the default IPython kernel are not maintained by the Jupyter team, but by the community. There may be discrepencies with implementation and/or bug fixes may be slower for community maintained kernels.
- Distinguish between running a separate kernel for working with a different programming language through the notebook and running the default kernel (IPython) with line or cell magics to incorporate another language in parts of the notebook.
- Outdated kernels: 
    - [Mochi Kernel](https://github.com/pya/mochi-kernel) - last updated in 2015.
    - [Calysto Processing](https://github.com/Calysto/calysto_processing) - last updated in May.
    - [Forth](https://github.com/jdfreder/iforth) - last updated in 2014.


#### Resources:
- [Issues with readline](https://github.com/IRkernel/IRkernel/issues/199)
- [More issues with readline](https://github.com/IRkernel/IRkernel/pull/452)
- Examples of polyglot data analysis: 
    [notebook from LAURENT GAUTIER (R and Python)](http://lgautier.github.io/jpd-pdapr-slides/notebooks/potholes.html)
    [notebook from LAURENT GAUTIER SQL and Python](http://lgautier.github.io/odsc-pdaibp-slides/notebooks/slides.html)
- [R vs Python: A false dichotomy](https://www.activestate.com/blog/2016/02/r-vs-python-false-dichotomy)
- [Pipelining R and Python in Notebooks](http://blog.revolutionanalytics.com/2016/01/pipelining-r-python.html)
- [RPy2 on the Yhat blog](http://blog.yhat.com/posts/rpy2-combing-the-power-of-r-and-python.html)
(Many of the above can be used as support for statement in introduction about advertised abilities of Jupyter Notebook to support cross-language collaborations)
- [RPy2 has been around since at least 2008](https://rpy2.bitbucket.io/) (initial commit on sourceforge = 2008-02-23)


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
- One of the rules should cover install. I remember having massive problems installing either Jupyter Notebook itself or the R magic or the R kernel (can't remember which)

http://blog.fperez.org/2012/01/ipython-notebook-historical.html

[magics]: http://ipython.readthedocs.io/en/stable/interactive/magics.html
[rpy2-cite]: https://rpy2.bitbucket.io/
[kernels-list]: https://github.com/jupyter/jupyter/wiki/Jupyter-kernels
[stackoverflow]: https://stackoverflow.com/