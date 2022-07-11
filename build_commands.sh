# Main analysis

Rscript -e "rmarkdown::render('0_Load_and_clean.Rmd',                       output_dir = 'knit_out')" &&
Rscript -e "rmarkdown::render('1_Exploratory_analysis.Rmd',                 output_dir = 'knit_out')" &&
Rscript -e "rmarkdown::render('2_Baseline_imputation.Rmd',                  output_dir = 'knit_out')" &&
time Rscript -e "rmarkdown::render('3a_Outcome_model_fit.Rmd',              output_dir = 'knit_out')" &&
time Rscript -e "rmarkdown::render('3b_Outcome_model_check.Rmd',            output_dir = 'knit_out')" &&
time Rscript -e "rmarkdown::render('4a_Subgroup_effects_paired_tables.Rmd', output_dir = 'knit_out')" &&
time Rscript -e "rmarkdown::render('4b_Subgroup_effect_estimates.Rmd',      output_dir = 'knit_out')" &&
time Rscript -e "rmarkdown::render('4c_Conditional_effects.Rmd',            output_dir = 'knit_out')" &&
Rscript -e "rmarkdown::render('5_Table_2_outcomes.Rmd',                     output_dir = 'knit_out')" &&
Rscript -e "rmarkdown::render('6_Table_1.Rmd',                              output_dir = 'knit_out')"

# Sensitivity analysis: SAP model with priors

time Rscript -e "rmarkdown::render('3a_2_Outcome_model_fit_with_priors.Rmd', output_dir = 'knit_out/main_fit_with_priors', params = list(fit_name = 'main_fit_with_priors'))" &&
Rscript -e "rmarkdown::render('3b_Outcome_model_check.Rmd',                  output_dir = 'knit_out/main_fit_with_priors', params = list(fit_name = 'main_fit_with_priors'))" &&
Rscript -e "rmarkdown::render('4a_Subgroup_effects_paired_tables.Rmd',       output_dir = 'knit_out/main_fit_with_priors', params = list(fit_name = 'main_fit_with_priors'))" &&
time Rscript -e "rmarkdown::render('4b_Subgroup_effect_estimates.Rmd',       output_dir = 'knit_out/main_fit_with_priors', params = list(fit_name = 'main_fit_with_priors'))" &&
rm output/28-35/main_fit_with_priors/subgroup_effects/*po* &&
time Rscript -e "rmarkdown::render('4c_Conditional_effects.Rmd',             output_dir = 'knit_out/main_fit_with_priors', params = list(fit_name = 'main_fit_with_priors'))"

# Sensitivity analysis: Original outcome definition

Rscript -e "rmarkdown::render('0_Load_and_clean.Rmd',                       output_dir = 'knit_out/28-30', params = list(outcome_min = 28, outcome_max = 30))" &&
Rscript -e "rmarkdown::render('1_Exploratory_analysis.Rmd',                 output_dir = 'knit_out/28-30', params = list(outcome_min = 28, outcome_max = 30))" &&
Rscript -e "rmarkdown::render('2_Baseline_imputation.Rmd',                  output_dir = 'knit_out/28-30', params = list(outcome_min = 28, outcome_max = 30))" &&
time Rscript -e "rmarkdown::render('3a_Outcome_model_fit.Rmd',              output_dir = 'knit_out/28-30', params = list(outcome_min = 28, outcome_max = 30))" &&
Rscript -e "rmarkdown::render('3b_Outcome_model_check.Rmd',                 output_dir = 'knit_out/28-30', params = list(outcome_min = 28, outcome_max = 30))" &&
time Rscript -e "rmarkdown::render('4a_Subgroup_effects_paired_tables.Rmd', output_dir = 'knit_out/28-30', params = list(outcome_min = 28, outcome_max = 30))" &&
time Rscript -e "rmarkdown::render('4b_Subgroup_effect_estimates.Rmd',      output_dir = 'knit_out/28-30', params = list(outcome_min = 28, outcome_max = 30))" &&
rm output/28-30/main_fit/subgroup_effects/*po* &&
time Rscript -e "rmarkdown::render('4c_Conditional_effects.Rmd',            output_dir = 'knit_out/28-30', params = list(outcome_min = 28, outcome_max = 30))"

# Sensitivity analysis: Extended outcome definition

Rscript -e "rmarkdown::render('0_Load_and_clean.Rmd',                       output_dir = 'knit_out/28-40', params = list(outcome_min = 28, outcome_max = 40))" &&
Rscript -e "rmarkdown::render('1_Exploratory_analysis.Rmd',                 output_dir = 'knit_out/28-40', params = list(outcome_min = 28, outcome_max = 40))" &&
Rscript -e "rmarkdown::render('2_Baseline_imputation.Rmd',                  output_dir = 'knit_out/28-40', params = list(outcome_min = 28, outcome_max = 40))" &&
## UP TO HERE
time Rscript -e "rmarkdown::render('3a_Outcome_model_fit.Rmd',              output_dir = 'knit_out/28-40', params = list(outcome_min = 28, outcome_max = 40))" &&
Rscript -e "rmarkdown::render('3b_Outcome_model_check.Rmd',                 output_dir = 'knit_out/28-40', params = list(outcome_min = 28, outcome_max = 40))" &&
time Rscript -e "rmarkdown::render('4a_Subgroup_effects_paired_tables.Rmd', output_dir = 'knit_out/28-40', params = list(outcome_min = 28, outcome_max = 40))" &&
time Rscript -e "rmarkdown::render('4b_Subgroup_effect_estimates.Rmd',      output_dir = 'knit_out/28-40', params = list(outcome_min = 28, outcome_max = 40))" &&
rm output/28-40/main_fit/subgroup_effects/*po* &&
time Rscript -e "rmarkdown::render('4c_Conditional_effects.Rmd',            output_dir = 'knit_out/28-40', params = list(outcome_min = 28, outcome_max = 40))" &&

# Sensitivity analysis: SAP model with extra covariates

Rscript -e "rmarkdown::render('3a_3_Outcome_model_fit_sap_extras.Rmd',  output_dir = 'knit_out/main_fit_sap_extras', params = list(fit_name = 'main_fit_sap_extras'))" &&
Rscript -e "rmarkdown::render('3b_Outcome_model_check.Rmd',             output_dir = 'knit_out/main_fit_sap_extras', params = list(fit_name = 'main_fit_sap_extras'))" &&
Rscript -e "rmarkdown::render('4a_Subgroup_effects_paired_tables.Rmd',  output_dir = 'knit_out/main_fit_sap_extras', params = list(fit_name = 'main_fit_sap_extras'))" &&
time Rscript -e "rmarkdown::render('4b_Subgroup_effect_estimates.Rmd',  output_dir = 'knit_out/main_fit_sap_extras', params = list(fit_name = 'main_fit_sap_extras'))" &&
rm output/28-35/main_fit_sap_extras/subgroup_effects/*po* &&
time Rscript -e "rmarkdown::render('4c_Conditional_effects.Rmd',        output_dir = 'knit_out/main_fit_sap_extras', params = list(fit_name = 'main_fit_sap_extras'))" &&

# No-interaction fit

Rscript -e "rmarkdown::render('3a_5_Outcome_model_fit_no_interactions.Rmd', output_dir = 'knit_out/main_fit_no_interactions', params = list(fit_name = 'main_fit_no_interactions'))" &&
Rscript -e "rmarkdown::render('3b_Outcome_model_check.Rmd',                 output_dir = 'knit_out/main_fit_no_interactions', params = list(fit_name = 'main_fit_no_interactions'))" &&
Rscript -e "rmarkdown::render('4a_Subgroup_effects_paired_tables.Rmd',      output_dir = 'knit_out/main_fit_no_interactions', params = list(fit_name = 'main_fit_no_interactions'))" &&
time Rscript -e "rmarkdown::render('4b_Subgroup_effect_estimates.Rmd',      output_dir = 'knit_out/main_fit_no_interactions', params = list(fit_name = 'main_fit_no_interactions'))" &&
rm output/28-35/main_fit_no_interactions/subgroup_effects/*po* &&
time Rscript -e "rmarkdown::render('4c_Conditional_effects.Rmd',            output_dir = 'knit_out/main_fit_no_interactions', params = list(fit_name = 'main_fit_no_interactions'))"

# Vanderbilt only fit

Rscript -e "rmarkdown::render('3a_7_Outcome_model_fit_Vanderbilt_only.Rmd', output_dir = 'knit_out/main_fit_Vanderbilt_only', params = list(fit_name = 'main_fit_Vanderbilt_only'))" &&
Rscript -e "rmarkdown::render('3b_7_Outcome_model_check_Vanderbilt_only.Rmd',                 output_dir = 'knit_out/main_fit_Vanderbilt_only', params = list(fit_name = 'main_fit_Vanderbilt_only'))" &&
Rscript -e "rmarkdown::render('4a_Subgroup_effects_paired_tables.Rmd',      output_dir = 'knit_out/main_fit_Vanderbilt_only', params = list(fit_name = 'main_fit_Vanderbilt_only'))" &&
time Rscript -e "rmarkdown::render('4b_Subgroup_effect_estimates.Rmd',      output_dir = 'knit_out/main_fit_Vanderbilt_only', params = list(fit_name = 'main_fit_Vanderbilt_only'))" &&
rm output/28-35/main_fit_Vanderbilt_only/subgroup_effects/*po* &&
time Rscript -e "rmarkdown::render('4c_Conditional_effects.Rmd',            output_dir = 'knit_out/main_fit_Vanderbilt_only', params = list(fit_name = 'main_fit_Vanderbilt_only'))"

# # # # # # #

Rscript -e "rmarkdown::render('7_Misc_manuscript_numbers.Rmd',              output_dir = 'knit_out')"
Rscript -e "rmarkdown::render('8_Comparing_model_fits.Rmd', output_dir = 'knit_out')"

# # # # # # # # # # EXTRA SENSITIVITY ANALYSES: ONLY IF TIME ALLOWS # # # # # # # # # # # # # # # #

# W/ alternative spline parametrization (w/ linear term)

Rscript -e "rmarkdown::render('3a_6_Outcome_model_fit_alternative_splines.Rmd', output_dir = 'knit_out/main_fit_alternative_splines', params = list(fit_name = 'main_fit_alternative_splines'))" &&
Rscript -e "rmarkdown::render('3b_Outcome_model_check.Rmd',                 output_dir = 'knit_out/main_fit_alternative_splines', params = list(fit_name = 'main_fit_alternative_splines'))" &&
Rscript -e "rmarkdown::render('4a_Subgroup_effects_paired_tables.Rmd',      output_dir = 'knit_out/main_fit_alternative_splines', params = list(fit_name = 'main_fit_alternative_splines'))" &&
time Rscript -e "rmarkdown::render('4b_Subgroup_effect_estimates.Rmd',      output_dir = 'knit_out/main_fit_alternative_splines', params = list(fit_name = 'main_fit_alternative_splines'))" &&
rm output/28-35/main_fit_alternative_splines/subgroup_effects/*po* &&
time Rscript -e "rmarkdown::render('4c_Conditional_effects.Rmd',            output_dir = 'knit_out/main_fit_alternative_splines', params = list(fit_name = 'main_fit_alternative_splines'))"

# Sensitivity analysis: SAP model w/ no splines (linear terms only)
# Rscript -e "rmarkdown::render('3a_3_Outcome_model_fit_linear.Rmd', output_dir = 'knit_out/main_fit_linear')"


# Day ~14 outcome (?)

# Sensitivity analysis: D14 outcome definition

Rscript -e "rmarkdown::render('0_Load_and_clean.Rmd',                       output_dir = 'knit_out/13-16', params = list(outcome_min = 13, outcome_max = 16))" &&
Rscript -e "rmarkdown::render('1_Exploratory_analysis.Rmd',                 output_dir = 'knit_out/13-16', params = list(outcome_min = 13, outcome_max = 16))" &&
Rscript -e "rmarkdown::render('2_Baseline_imputation.Rmd',                  output_dir = 'knit_out/13-16', params = list(outcome_min = 13, outcome_max = 16))" &&
time Rscript -e "rmarkdown::render('3a_Outcome_model_fit.Rmd',              output_dir = 'knit_out/13-16', params = list(outcome_min = 13, outcome_max = 16))" &&
Rscript -e "rmarkdown::render('3b_Outcome_model_check.Rmd',                 output_dir = 'knit_out/13-16', params = list(outcome_min = 13, outcome_max = 16))" &&
time Rscript -e "rmarkdown::render('4a_Subgroup_effects_paired_tables.Rmd', output_dir = 'knit_out/13-16', params = list(outcome_min = 13, outcome_max = 16))" &&
time Rscript -e "rmarkdown::render('4b_Subgroup_effect_estimates.Rmd',      output_dir = 'knit_out/13-16', params = list(outcome_min = 13, outcome_max = 16))" &&
time Rscript -e "rmarkdown::render('4c_Conditional_effects.Rmd',            output_dir = 'knit_out/13-16', params = list(outcome_min = 13, outcome_max = 16))"

