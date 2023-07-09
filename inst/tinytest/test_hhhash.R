library(hhhash)

c(
  "Date", "Server", "Strict-Transport-Security",
  "Last-Modified", "ETag", "Accept-Ranges",
  "Content-Length", "Content-Security-Policy",
  "X-Content-Type-Options", "X-Frame-Options",
  "X-XSS-Protection", "Content-Type"
) -> keys # nolint: assignment_linter.

expect_equal(
  hash_headers(keys),
  "hhh:1:78f7ef0651bac1a5ea42ed9d22242ed8725f07815091032a34ab4e30d3c3cefc"
)
