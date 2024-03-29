# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

chisq_fix_reject <- function(design, n1, nuisance, type) {
    .Call('_blindrecalc_chisq_fix_reject', PACKAGE = 'blindrecalc', design, n1, nuisance, type)
}

chisq_recalc_reject <- function(design, n1, nuisance, type, nmat) {
    .Call('_blindrecalc_chisq_recalc_reject', PACKAGE = 'blindrecalc', design, n1, nuisance, type, nmat)
}

p_rml <- function(p_c, p_e, r, margin) {
    .Call('_blindrecalc_p_rml', PACKAGE = 'blindrecalc', p_c, p_e, r, margin)
}

fm_fix_reject <- function(design, n, nuisance, type) {
    .Call('_blindrecalc_fm_fix_reject', PACKAGE = 'blindrecalc', design, n, nuisance, type)
}

fm_recalc_reject <- function(design, n1, nuisance, type, nmat) {
    .Call('_blindrecalc_fm_recalc_reject', PACKAGE = 'blindrecalc', design, n1, nuisance, type, nmat)
}

