# Set colours for extraction tools.
tool_cols <- c(
  "Essentia" = "#791a32",
  "Librosa" = "#e9730cee",
  "MIRtoolbox" = "#417a4a"
)
load("data/df_fig8.rda")

df_fig8 %>%
  ggplot(
    aes(
      x = tool,
      colour = tool,
      y = mean_diff
    )
  ) +
  geom_segment(
    aes(
      y = lower_ci,
      yend = upper_ci
    )
  ) +
  geom_point(shape = 16, size = 5) +
  theme_maple() +
  theme(
    legend.position = "bottom",
    axis.title.x = element_blank(),  # Remove x-axis title
    axis.text.x = element_blank(),   # Remove x-axis text
    axis.ticks.x = element_blank(),   # Remove x-axis ticks
    axis.title = element_text(size = 20),     # Axis titles
    axis.text = element_text(size = 15),      # Tick text
    legend.text = element_text(size = 17.5),    # Legend text
    strip.text = element_text(size = 12.5)       # Facet labels
  ) +
  labs(
    y = "Absolute Mean Difference from Baseline",
    colour = NULL
  ) +
  scale_colour_manual(values = tool_cols)
ggsave(
  paste0(
    "img/",
    "fig8",
    ".png"
  )
)
