#' @useDynLib hhhash R_split_string
split_string <- function(x, split = ":") {
  .Call(R_split_string, x, split)
}

#' Build a hash from a vector of HTTP header keys
#'
#' @param keys a character vector of HTTP header keys
#' @param version hhhash version (defaults to `1L`)
#' @return A hash of headers
#' @export
#' @examples
#' c(
#'   "Date", "Server", "Strict-Transport-Security",
#'   "Last-Modified", "ETag", "Accept-Ranges",
#'   "Content-Length", "Content-Security-Policy",
#'   "X-Content-Type-Options", "X-Frame-Options",
#'   "X-XSS-Protection", "Content-Type"
#' ) -> keys
#'
#' hash_headers(keys)
hash_headers <- function(keys, version = 1L) {
  keys_concat <- paste0(keys, collapse = ":")
  keys_digest <- sha256(keys_concat)
  sprintf("hhh:%s:%s", version, keys_digest)
}

#' Build a hash from headers in an {curl} response object
#'
#' @param response an {curl} response object
#' @param version hhhash version (defaults to `1L`)
#' @return A hash of headers
#' @export
#' @examples
#' res <- curl::curl_fetch_memory("https://www.circl.lu/", curl::new_handle())
#' 
#' build_hash_from_response(res)
build_hash_from_response <- function(response, version = 1L) {

  headers <- curl::parse_headers(response$headers)

  headers <- grep(":", headers, fixed = TRUE, value = TRUE)
  out <- lapply(headers, split_string, ":")
  keys <- vapply(out, `[[`, character(1), 1)

  hash_headers(keys, version)

}

#' Build a hash from headers retrieved from a URL
#'
#' @param url URL to retrieve headers from
#' @param handle a {curl} handle; by default it creates a new one
#' @param version hhhash version (defaults to `1L`)
#' @return A hash of headers
#' @export
#' @examples
#' build_hash_from_url("https://www.circl.lu/")
build_hash_from_url <- function(url, handle = curl::new_handle(), version = 1L) { # nolint: line_length_linter.

  res <- curl::curl_fetch_memory(url, handle)

  build_hash_from_response(res, version)

}