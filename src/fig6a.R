library(ggplot2)
library(magrittr)
library(MAPLE.emo)
library(dplyr)
names(tool_cols) <- tolower(names(tool_cols))
load("data/df_fig6.rda")
df_fig6 %>%
  filter(
    level == 88
  ) %>%
  ggplot(
    aes(
      x = as.numeric(level),
      y = diff,
      colour = tool
    )
  ) +
  geom_vline(
    xintercept = 88,
    colour = "darkgray"
  ) +
  geom_hline(
    yintercept = 0,
    colour = "darkgray"
  ) +
  geom_point(size = 5) +
  theme_maple() +
  scale_colour_manual(values = tool_cols) +
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
  lims(
    x = c(30, 300)
  ) +
  scale_y_continuous(
    breaks = c(-20, 0, 20, -40, -60, -80, 40),
    limits = c(-80, 50)
  )
filename <- paste0(
  "img/",
  "fig6a",
  ".png"
)
ggsave(filename)