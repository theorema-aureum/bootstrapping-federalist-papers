### Necessary packages. ###
library(tidyverse)


### Necessary CSV files.###
# unknown_tokenized <- read_csv()


### Bootstrap samples from Federalist Paper No. 51.
# Take samples of 5 words and calculate their average word length. Place the 
# results on a histogram. On the histogram, place vertical lines showing the 
# average word length of the known authors and author combination. Use this to
# predict a potential author for Federalist Paper No. 51.

# Use replicate() to take 1,000 samples and store the results in a table.
averages_list <- replicate(
  1000,
  unknown_tokenized %>% 
    slice_sample(n = 5) %>% 
    summarize(avg_length = sum(nchar(words)) / 5)
  )

sample_averages <- averages_list %>% map_df(as_tibble) 

# Make a histogram using sample_averages.
# Stylistic note: Initially, I wanted to have a legend displayed showing the 
# line color and its matching author. Doing so would require the use of the 
# function scale_color_manual(), which necessitates a column to reference.
# Since I am using an x-intercept, this is not the most practical choice.
ggplot(sample_averages, aes(x = value)) +
  geom_histogram(binwidth = 0.1) +
  geom_vline(xintercept = 4.923508, color = "black") +
  geom_vline(xintercept = 5.013823, color = "red") +
  geom_vline(xintercept = 4.903823, color = "darkgreen") +
  geom_vline(xintercept = 4.834774, color = "darkorange1") +
  geom_vline(
    aes(xintercept = mean(value)), 
    color = "blue", 
    linetype = "dashed", 
    size = 1.2
    ) +
  scale_x_continuous(breaks = seq(2, 10, 1)) +
  labs(
    title = "Bootstrapped Sample of Average Word Length from Federalist Paper No. 51",
    x = "Average Word Length",
    y = "Frequency",
    caption = " Black - Hamilton, Red - Hamilton and Madison, Green - Jay, Orange - Madison, Blue - Unknown"
    ) +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5))


# Zoom in to get a better view.
ggplot(sample_averages, aes(x = value)) +
  geom_histogram(binwidth = 0.1) +
  geom_vline(xintercept = 4.923508, color = "black", size = 1.2) +
  geom_vline(xintercept = 5.013823, color = "red", size = 1.2) +
  geom_vline(xintercept = 4.903823, color = "darkgreen", size = 1.2) +
  geom_vline(xintercept = 4.834774, color = "darkorange1", size = 1.2) +
  geom_vline(
    aes(xintercept=mean(value)), 
    color = "blue", 
    linetype ="dashed", 
    size = 1.2
    ) +
  scale_x_continuous(lim = c(4.7, 5.2)) +
  labs(
    title = "Bootstrapped Sample of Average Word Length from Federalist Paper No. 51",
    subtitle = "(Zoomed in for an Enhanced View)",
    x = "Average Word Length",
    y = "Frequency",
    caption = " Black - Hamilton, Red - Hamilton and Madison, Green - Jay, Orange - Madison, Blue - Unknown"
  ) +
  theme_classic() +
  theme(
    plot.title = element_text(hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5)
    )

# Observe that the bootstrapped average word length and actual average word 
# length for Federalist Paper No. 51 are almost identical. It is clear that 
# the blue dashed line (unknown author) and the black line (Hamilton) are 
# practically the same. Based on the average word length of the 
# bootstrapped samples, Alexander Hamilton is most likely the author of 
# Federalist Paper No. 51. (Keep in mind that average word length alone
# is a very rough estimation of authorship). 