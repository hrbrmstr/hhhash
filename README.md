
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![R](https://github.com/hrbrmstr/hhhash/workflows/R/badge.svg)](https://github.com/hrbrmstr/hhhash/actions?query=workflow%3AR)
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-4.0.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# hhhash

HTTP Headers Hashing

## Description

HTTP Headers Hashing (HHHash) is a technique used to create a
fingerprint of an HTTP server based on the headers it returns. HHHash
employs one-way hashing to generate a hash value for the set of header
keys returned by the server. See
<https://www.foo.be/2023/07/HTTP-Headers-Hashing_HHHash> for more info.

## What’s Inside The Tin

The following functions are implemented:

- `build_hash_from_response`: Build a hash from headers in an curl
  response object
- `build_hash_from_url`: Build a hash from headers retrieved from a URL
- `hash_headers`: Build a hash from a vector of HTTP header keys
- `sha256`: Convience wrapper for digest::digest() with algo = “sha256”
  and serialize = FALSE

## Installation

``` r
remotes::install_github("hrbrmstr/hhhash")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(hhhash)

# current version
packageVersion("hhhash")
## [1] '0.1.1'
```

``` r
build_hash_from_url("https://www.circl.lu/")
## [1] "hhh:1:78f7ef0651bac1a5ea42ed9d22242ed8725f07815091032a34ab4e30d3c3cefc"
```

``` r
res <- curl::curl_fetch_memory("https://www.circl.lu/", curl::new_handle())

build_hash_from_response(res)
## [1] "hhh:1:78f7ef0651bac1a5ea42ed9d22242ed8725f07815091032a34ab4e30d3c3cefc"
```

``` r
c(
  "Date", "Server", "Strict-Transport-Security",
  "Last-Modified", "ETag", "Accept-Ranges",
  "Content-Length", "Content-Security-Policy",
  "X-Content-Type-Options", "X-Frame-Options",
  "X-XSS-Protection", "Content-Type"
) -> keys

hash_headers(keys)
## [1] "hhh:1:78f7ef0651bac1a5ea42ed9d22242ed8725f07815091032a34ab4e30d3c3cefc"
```

## hhhash Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
|:-----|---------:|-----:|----:|-----:|------------:|-----:|---------:|-----:|
| R    |        4 | 0.25 |  26 | 0.18 |          14 | 0.39 |       56 | 0.47 |
| C    |        2 | 0.12 |  24 | 0.17 |           4 | 0.11 |        3 | 0.03 |
| JSON |        1 | 0.06 |  20 | 0.14 |           0 | 0.00 |        0 | 0.00 |
| YAML |        1 | 0.06 |   1 | 0.01 |           0 | 0.00 |        0 | 0.00 |
| SUM  |        8 | 0.50 |  71 | 0.50 |          18 | 0.50 |       59 | 0.50 |

{cloc} 📦 metrics for hhhash

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
