library(ggplot2)
library(magrittr)
library(dplyr)
library(MAPLE.emo)
names(tool_cols) <- tolower(names(tool_cols))
load("data/df_fig7.rda")
df_fig7 %>%
  group_by(
    tool,
    feature,
    level
  ) %>%
  summarize(
    mean_diff = mean(diff),
    sd_diff = sd(diff),
    n = n(),  # Sample size for each group
    se_diff = sd_diff / sqrt(n),  # Standard error
    t_value = qt(0.975, df = n - 1),  # t-critical value for 95% CI
    margin_of_error = t_value * se_diff,  # CI margin of error
    lower_ci = mean_diff - margin_of_error,  # Lower bound of CI
    upper_ci = mean_diff + margin_of_error   # Upper bound of CI
  ) %>%
  ggplot(
    aes(
      x = as.numeric(level),
      y = mean_diff,
      colour = tool
    )
  ) +
  geom_hline(
    yintercept = 0,
    colour = "darkgray"
  ) +
  geom_segment(
    aes(
      y = lower_ci,
      yend = upper_ci
    ),
    colour = "lightgray"
  ) +
  geom_point(
    shape = 16
  ) +
  theme_maple() +
  theme(
    legend.position = "none",
    axis.title = element_text(size = 20),  # Axis titles
    axis.text = element_text(size = 17.5),   # Tick text
    legend.text = element_text(size = 17.5)   # Legend text
  ) +
  labs(
    x = "Manipulation Level (BPM)",
    y = "Difference from Baseline (# Onsets)"
  ) +
  scale_colour_manual(values = tool_cols) +
  lims(
    x = c(30, 300)
  ) +
  scale_y_continuous(
    breaks = c(-20, 0, 20, -40, 40, 60),
    limits = c(-50, 70)
  )
filename <- paste0(
  "img/",
  "fig7",
  ".png"
)
ggsave(filename)