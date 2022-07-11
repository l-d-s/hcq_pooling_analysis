require(tidyverse)

# Install cmdstanr manually, if required
# devtools::install_version("cmdstanr", version = "0.4.0", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))

# Graphics
require(ggbeeswarm)
require(cowplot)
require(lemon)
require(patchwork)

theme_set(theme_cowplot())
theme_update(
  strip.background = element_blank(),
  strip.text.y = element_text(angle = 0),
  strip.text = element_text(face = "bold")
  )


gg_scatter <- function(data, x_var, y_var) {
  qplot({{x_var}}, {{y_var}}, 
        data = data,
        size = I(0.4)) +
    cowplot::theme_cowplot()
}

gg_hist <- function(data, x_var, n_bins = 30) {
  qplot({{x_var}}, bins = I(n_bins), 
        data = data,
        color = I("white")) +
    scale_y_continuous(expand = expansion(0, .05)) +
    cowplot::theme_cowplot()
}

gg_niaid_scatter <- function(data, x_var, y_var) {
  ggplot(data) + 
    geom_rect(aes(
      ymin = as.numeric(y) - .5, 
      ymax = as.numeric(y) + .5, 
      xmin = I(-Inf), xmax = I(Inf)), 
      color = "white", fill = "grey80", alpha = .2, size = 2,
      data = tibble(y = factor(niaid_levels, ordered = TRUE))) +
    geom_jitter(aes({{x_var}}, as.numeric({{y_var}})),
                size = I(0.4),  width = I(1.5)) +
    scale_y_continuous(breaks = 1:7, labels = niaid_levels)
}


require(bayesplot)
bayesplot_theme_set(theme_cowplot())
bayesplot_theme_update(
  strip.background = element_blank(),
  strip.text.y = element_text(angle = 0),
  strip.text = element_text(face = "bold")
)

set.seed(20200524)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# NIAID scale

niaid_levels <- c(
  "1 - death",
  "2 - hosp, mech vent",
  "3 - hosp, NIV",
  "4 - hosp, supp ox",
  "5 - hosp, no ox",
  "6 - no hosp, lim",
  "7 - no hosp, no lim")

require(colorspace)
niaid_colors <-
  c(
    "1 - death"           = "grey30", 
    "2 - hosp, mech vent" = darken("coral1", .55),
    "3 - hosp, NIV"      = darken("coral1", .35), 
    "4 - hosp, supp ox"   = "coral1",
    "5 - hosp, no ox"     = lighten("coral1", .2), 
    "6 - no hosp, lim"    = darken("cornflowerblue"), 
    "7 - no hosp, no lim" = "cornflowerblue"
  )
  
# Site ids

siteid_vec <- c(
  "1-ORCHID", 
  "2-WashU", 
  "3-Duke", 
  "4-NYU-TEACH",
  "5-Bassett", 
  "6-IM-HAHPS", 
  "7-UMC-New Orleans",
  "8-QMC-Honolulu"
)

site_label_vec <- c(
  `1-ORCHID` = "ORCHID", 
  `2-WashU` = "WU352", 
  `3-Duke` = "Duke", 
  `4-NYU-TEACH` = "TEACH",
  `5-Bassett` = "COVID MED", 
  `6-IM-HAHPS` = "HAHPS", 
  `7-UMC-New Orleans` = "UMC New Orleans",
  `8-QMC-Honolulu` = "OAHU-COVID19"
)

#### For creating tables

ci_fmt <- function(
  estimate, lower, upper, 
  accuracy = .01, 
  separator = " to ",
  trim = FALSE, ...) {
  if (!all((lower <= estimate) & (estimate <= upper) | 
           is.na((lower <= estimate) & (estimate <= upper))))
    { warning("Violation of lower <= estimate <= upper") }
  
  ci_str <- str_c(
    scales::number(estimate, accuracy = accuracy, trim = trim), 
    " (", 
    scales::number(lower,    accuracy = accuracy, trim = trim),
    separator, 
    scales::number(upper,    accuracy = accuracy, trim = trim),
    ")")
  
  return(ci_str)
}

