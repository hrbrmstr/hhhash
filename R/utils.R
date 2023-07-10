#' Convience wrapper for digest::digest() with algo  = "sha256" and serialize = FALSE
#' 
#' @param obj object to make a hash for (ideally a length 1 character vector)
#' @export
sha256 <- function(obj) {
  digest::digest(obj, algo = "sha256", serialize = FALSE)
}
