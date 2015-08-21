# Strategic Data Project Capstone Project

## Getting a copy of the materials
If you don't currently - or regularly - use Git for version control, the first step would be to download and install Git on your computer from [http://www.git-scm.com](http://www.git-scm.com).  If you are working from a computer using the Windows operating system, be sure to install the GitBash program that is optional when installing Git; GitBash installs a minimal MinGW set up on your computer, which provides a \*nix-based command line terminal that can be used in a Windows operating system environment.  Once you have the software downloaded and installed, you can then easily copy and keep your copy of these files up to date with what you see here on GitHub relatively easily:

```
cd /c/Users/billy/Desktop
git clone https://github.com/wbuchanan/capstoneProjectSDP
```

The first line above is used to tell GitBash where you want to copy the repository.  You should be able to substitute paths like C:\ in Windows with /c/ in GitBash.  In this case, I would be changing the current directory to the desktop.  The next line creates a copy of the entire repository on your local computer.  If you notice/see changes in the future, you can use ```git pull https://github.com/wbuchanan/capstoneProjectSDP``` to update your copy of the repository with the most current version on GitHub.

## Guide to the Repository
This is a brief explanation of where to find things and what the different subdirectories contain.

### code
There are three subdirectories containing code used in Mplus, R, and Stata.  The sdpCohortGroup.stpj file in the root directory is a Stata project file that should help you to view the code files in a bit more organized of a way.  

### documentation
Contains documentation produced by Stata during the data cleaning and joining.

### html
This directory contains both the HTML file (a CSS file with some additional styling settings) and the R Markdown file used to create the slides presented to SDP Cohort 5 at the graduation gathering 19aug2015-20aug2015.  If you save a copy of the HTML file locally (e.g., download it to your computer) you should be able to open the file and view the slides.  

### output	
This directory contains the preliminary and final output from all of the models that were tested.  The primary difference in the files is the amount of commenting included in the final subdirectory since it produced a fair amount of issues when trying to parse the results.  The files that end with the .inp extension contain just the code required to fit the models to the data.  The files ending with .out also contain the syntax used to fit the models, but also include parameter estimates, descriptive statistics, and other information about model fit and the estimated parameters.

### visualizations
These are preliminary visualizations used in the drafts of our group's report to show some of the relationships in different ways and were all created in Stata.  


## Meta Matters Group	
Code used to clean, assemble, and analyze log files for SDP capstone project.

### Group Members
Lisa Deffendall, Lu Han, & Billy Buchanan



