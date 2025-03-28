### Necessary packages ###
library(rvest)
library(tidyverse)


### Needed URLs ###
# Jay, Hamilton, and Madison
Link1 <- read_html("https://guides.loc.gov/federalist-papers/text-1-10#s-lg-box-wrapper-25493264") 

# Hamilton and Madison (co-authors)
Link2 <- read_html("https://guides.loc.gov/federalist-papers/text-11-20#s-lg-box-wrapper-25493282")

# Unknown author
Link3 <- read_html("https://guides.loc.gov/federalist-papers/text-51-60#s-lg-box-wrapper-25493427")


### Web scrape the URLs. ###
# NOTE: The heading with paper numbers and the text are different elements in 
# HTML, so by the nature of the html_nodes() function in rvest, two separate
# elements cannot be pulled at the same time. It makes the most sense to pull
# the text from the <p> element and separate the papers based on subtitle and
# ending text, often the word "PUBLIUS."

# Prep the URLs by retrieving the text and storing it in a table. By default,
# the text saves to a column named ".", so use base R to rename the column. 
# tidyverse is particular with the use of periods, so this will make the 
# FPClean script a bit easier to use.
Link1_prep <- Link1 %>%
  html_nodes("p") %>%
  html_text() %>%
  tibble()

colnames(Link1_prep) <- "body_text"

Link2_prep <- Link2 %>%
  html_nodes("p") %>%
  html_text() %>%
  tibble()

colnames(Link2_prep) <- "body_text"

Link3_prep <- Link3 %>%
  html_nodes("p") %>%
  html_text() %>%
  tibble()

colnames(Link3_prep) <- "body_text"

# Pull paper by author.
# Hamilton - Concerning Dangers from Dissensions Between the States
Hamilton <- Link1_prep %>% slice(99:119)

# Madison - The Same Subject Continued: The Union as a Safeguard Against 
#           Domestic Faction and Insurrection
Madison <- Link1_prep %>% slice(178:201)

# Jay - Concerning Dangers from Foreign Force and Influence
Jay <- Link1_prep %>% slice(19:34)

# Hamilton and Madison - The Same Subject Continued: The Insufficiency of the 
#                         Present Confederation to Preserve the Union
HamiltonMadison <- Link2_prep %>% slice(121:142)

#Unknown - The Structure of the Government Must Furnish the Proper Checks and 
#         Balances Between the Different Departments
Unknown <- Link3_prep %>% slice(4:6)


### Export the papers as CSV files. ###
# Make the tables into a list, and use a for loop to write the list into CSV
# files with the table names as the file names . write_csv is very temperamental 
# when used with loops, so use base-R functions in the for loop.
paper_list <- list(
  "Hamilton" = Hamilton, 
  "Madison" = Madison, 
  "Jay" = Jay, 
  "HamiltonMadison" = HamiltonMadison,
  "Unknown" = Unknown
  )

# Use a for loop to write papers into CSV files. Although this can be written
# as one xlsx file with multiple sheets, using several CSV files is the more
# practical choice for R.
for(x in 1 : length(paper_list)) {
  write.csv(
    paper_list[[x]], 
    file = paste0(names(paper_list)[[x]], ".csv")
    )
}