#!/usr/bin/env dsc

%include modules/presimulate
%include modules/simulate
%include modules/initialize
%include modules/susie
%include modules/score

DSC:
  define:
    presimulate: compute_beta_sigma 
  run: 
    gaussian: presimulate * sim_gaussian * init_susie * susie * score
    gaussian_large: presimulate * sim_gaussian_large * init_susie * susie_large * score
    gaussian_init: presimulate * sim_gaussian * init_susieL0 * susie_init * score
    gaussian_prior: presimulate * sim_gaussian * init_susie * susie_prior * score
    
  exec_path: modules, code
  R_libs: MASS, glmnet, susieR@stephenslab/susieR, L0Learn@hazimehh/L0Learn
  global:
    pathX: "data/X_random.rds"
    pathy: "data/y_random.rds"