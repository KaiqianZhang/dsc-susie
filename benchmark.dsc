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
    gaussian_init: presimulate * sim_gaussian * (init_susieL0, init_susieglm) * susie_init * score
    gaussian_prior: presimulate * sim_gaussian * init_susie * susie_prior * score
    binary: presimulate * sim_binary * init_susie * susie * score
    binary_large: presimulate * sim_binary_large * init_susie * susie_large * score
    binary_init: presimulate * sim_binary * (init_susieL0, init_susieglm) * susie_init * score

  exec_path: modules, code
  R_libs: MASS, glmnet, susieR@stephenslab/susieR, L0Learn@hazimehh/L0Learn
  global:
    pathX: "data/wbbr_test_X.rds"
    pathy: "data/wbbr_test_y.rds"
    
    
    
    
    
    
    
    