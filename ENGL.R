library(ggplot2)
library(tidyverse)

pre_test_data <- data.frame(
  PT1 = c('no', 'no', 'no', 'no', 'no'), 
  Age = c('21-24','21-24','36+', '18-20', '18-20' ),
  Browser = c('Safari', 'Safari', 'Safari', 'Google', 'Safari'),
  TimesDowntown = c(6, 10, 5, 1, 10), 
  SoldDowntown = c('no', 'no', 'no', 'no', 'no')
)

time_of_task_data <- data.frame(
  '1' = c(151, 114, 150, 120, 76),
  '2' = c(44, 62, 30, 15, 53),
  '3' = c(49, 20, 30, 25, 105),
  '4' = c(193, 69, 245, 30, 106),
  '5' = c(142, 37, 15, 60, 72),
  check.names = FALSE
)

num_pages_task_data <- data.frame(
  '1' = c(7, 6, 12, 21, 3),
  '2' = c(5, 3, 5, 4, 3),
  '3' = c(4, 2, 2, 2, 6),
  '4' = c(12, 3, 13, 2, 4),
  '5' = c(7, 4, 3, 7, 5),
  check.names = FALSE
)

post_test_data_1 <- data.frame(
  stuckOrFrustration = c('Volunteer', 'Parking', 'Parking', 'Volunteer', 'Parking', 'Holiday Market')
)
post_test_data_2 <- data.frame(
  confidence = c(6, 5, 9, 7, 8)
)

number_of_dead_clicks <- data.frame(
  Clicks=c(0, 1, 1, 1, 10, 0, 0, 2, 0, 0, 0,0,0,0,0,0,0,0,0,0, 0,0,1,0,0)
)

pre_test_data %>% ggplot(aes(x = factor(Age))) +
  geom_bar(fill = 'steelblue') +
  scale_y_continuous(breaks = seq(0, 5, by = 1)) +
  theme_bw() +
  labs(title = "Number of Users per Age Group",
       x = "Age Group",
       y = "Number of Users")

pre_test_data %>% ggplot(aes(x = factor(Age))) +
  geom_bar(fill = 'steelblue') +
  scale_y_continuous(breaks = seq(0, 5, by = 1)) +
  theme_bw() +
  labs(title = "Number of Users per Age Group",
       x = "Age Group",
       y = "Number of Users")

pre_test_data %>% ggplot(aes(x = factor(Browser))) +
  geom_bar(fill = 'steelblue') +
  scale_y_continuous(breaks = seq(0, 5, by = 1)) +
  theme_bw() +
  labs(title = "Number of Users per Web Browser",
       x = "Browser",
       y = "Number of Users")

time_of_task_data %>%
  pivot_longer(
    cols = everything(),
    names_to = "Task",
    values_to = "CompletionTime",
    names_transform = list(Task = as.numeric)
  ) %>%
  mutate(Task = factor(Task, levels = c("1", "2", "3", "4", "5"))) %>%
  ggplot(aes(x = factor(Task), y = CompletionTime)) +
  geom_boxplot(fill = "steelblue") +
  coord_flip() +
  theme_bw() +
  labs(
    title = "Completion Time by Task",
    x = "Task",
    y = "Completion Time (seconds)"
  )

num_pages_task_data %>%
  pivot_longer(
    cols = everything(),
    names_to = "Task",
    values_to = "NumberOfPages",
    names_transform = list(Task = as.numeric)
  ) %>%
  mutate(Task = factor(Task, levels = c("1", "2", "3", "4", "5"))) %>%
  ggplot(aes(x = factor(Task), y = NumberOfPages)) +
  geom_boxplot(fill = "steelblue") +
  coord_flip() +
  theme_bw() +
  labs(
    title = "Number of Pages by Task",
    x = "Task",
    y = "Number of Pages"
  )

ggplot(data=post_test_data_1, aes(x = stuckOrFrustration)) +
  geom_bar(fill = 'steelblue') +
  scale_y_continuous(breaks = seq(0, 5, by = 1)) +
  theme_bw() +
  labs(title = "Number of Users That Identified Tasks as Frustrating",
       x = "Task",
       y = "Number of Users")

ggplot(data=number_of_dead_clicks, aes(x = Clicks)) +
  geom_histogram(fill = 'steelblue') +
  scale_y_continuous(breaks = seq(0, 20, by = 1)) +
  scale_x_continuous(breaks = seq(0, 10, by = 1)) +
  theme_bw() +
  labs(title = "How Often Dead Clicks Occured",
       x = "Number of Dead Clicks Per Task ",
       y = "Number of occurances")



