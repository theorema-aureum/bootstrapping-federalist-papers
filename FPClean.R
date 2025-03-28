### Necessary Packages. ###
library(tidytext)
library(tidyverse)


### Necessary CSV files. ###
# Hamilton <- read_csv()
# Madison <- read_csv()
# Jay <- read_csv()
# HamiltonMadison <- read_csv()


### Find the average word length of the above documents. ###
# A for loop could work, but it acts difficult when unnest_tokens() is called
# since the input column cannot be pulled from lists. It makes more sense to 
# create an author column for each paper, row-bind the tables, and group by 
# author before applying unnest_tokens(). 
Hamilton <- Hamilton %>% mutate(author = "Hamilton")
Madison <- Madison %>% mutate(author = "Madison")
Jay <- Jay %>% mutate(author = "Jay")
HamiltonMadison <- HamiltonMadison %>% mutate(author = "Hamilton and Madison")
Unknown <- Unknown %>% mutate(author = "Unknown")

papers <- rbind(Hamilton, Madison, Jay, HamiltonMadison, Unknown)

word_counts <- papers %>% 
  unnest_tokens(
    input = "body_text", 
    output = "words", 
    token = "words"
    ) %>% 
  group_by(author) %>% 
  count(words, sort = TRUE) %>% 
  mutate(
    word_length = nchar(words),
    total_length = n * word_length
  )

# Group by author and calculate the average word length.
author_avg_word_length <- word_counts %>% 
  group_by(author) %>% 
  summarize(`average word length` = sum(total_length)/sum(n))


### Tokenize Federalist Paper No. 51 (author unknown) and write to a CSV. ###
unknown_tokenized <- Unknown %>%
  unnest_tokens(
    input = "body_text", 
    output = "words", 
    token = "words"
  )

write.csv(unknown_tokenized, file = "Unknown_Tokenized.csv")