# bootstrapping-federalist-papers
The authorship of Federalist Paper No. 51 has long been debated. This project showcases web scraping, text analysis, and bootstrapping techniques to provide a rough estimate of its possible author among the known authors of the Federalist Papers.

# The following is from the RMarkdown README file.

## **Overview and Limitations**

#### This project is adapted from a high school statistics course activity on
#### taking random samples. In the activity, students are given the opening 
#### paragraph of *Federalist Paper No. 51*. Although unknown at the time, the 
#### authors of the Federalist Papers were found out to be Alexander Hamilton,
#### James Madison, and John Jay. Out of the 73 papers, 12 papers have disputed 
#### authorship. It is now believed that these 12 papers were authored by James
#### Madison or a collaboration of James Madison and Alexander Hamilton.

&nbsp;

#### This activity instructs students to take five meaningful words from the
#### essay, find the average length, and place the average on a histogram. They 
#### then use a random number generator on a graphing calculator and place the 
#### result on a separate histogram. The activity is designed to get students 
#### thinking about the relationship between random sampling and the normal
#### distribution. What this activity does not do is predict the authorship of
#### *Federalist Paper No. 51*. 

## **Purpose**

#### This project will predict the authorship of *Federalist Paper No. 51.* 
#### using rudimentary aspects of text analysis and bootstrapping to generate
#### a  distribution of average word length and comparing the results to the
#### average word length of a paper written by Hamilton, Madison, and Jay.

&nbsp;

#### I've included the following papers:
#### *Federalist Paper No. 51* - Unknown
#### *Federalist Paper No. 6* - Alexander Hamilton
#### *Federalist Paper No. 10* - James Madison
#### *Federalist Paper No. 2* - John Jay
#### *Federalist Paper No. 18* - Hamilton and Madison

## **Procedure**
#### You will need the rvest, tidytext and tidyverse packages for this project.

&nbsp;

#### This project is comprised of several scripts in this order:
#### 1. FPWebScrape - Web scrape the text needed for the project.
#### 2. FPClean - Use text analysis and data cleaning to prep the documents.
####    Find the average word length of papers with known authors.
#### 3. FPBootstrap - Bootstrap to predict the paper with unknown author.





