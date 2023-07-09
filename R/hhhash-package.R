# nolint start

#' HTTP Headers Hashing
#'
#' HTTP Headers Hashing (HHHash) is a technique used to create a
#' fingerprint of an HTTP server based on the headers it returns.
#' HHHash employs one-way hashing to generate a hash value for the
#' set of header keys returned by the server
#'
#' @md
#' @name hhhash
#' @keywords internal
#' @author Bob Rudis (bob@@rud.is)
#' @import curl
#' @useDynLib hhhash, .registration = TRUE
"_PACKAGE"

# nolint end
