
#  ------------------------------------------------------------------------
#
# Title : Package Initialization
#    By : Jimmy Briggs
#  Date : 2024-09-07
#
#  ------------------------------------------------------------------------

# libraries ---------------------------------------------------------------
source("dev/00_pkg_libs.R")

# package initialization -------------------------------------------------
usethis::create_package("gmhleasr")

usethis::use_directory("dev", TRUE)
usethis::use_namespace()
usethis::use_roxygen_md()
usethis::use_readme_md(open = FALSE)
usethis::use_proprietary_license("No Clocks, LLC")

usethis::use_description(
  fields = list(
    Title = "Shiny Dashboard and API Client for GMH Communities Leasing Data",
    Description = "Provides a Shiny dashboard and API client for interacting with GMH Communities leasing data via the Entrata API. Includes functions for API authentication, data retrieval, and data visualization.",
    Language =  "en-US"
  )
)

usethis::use_author(
  "Jimmy",
  "Briggs",
  email = "jimmy.briggs@noclocks.dev",
  role = c("aut", "cre"),
  comment = c(ORCID = "0000-0002-7489-8787")
)

usethis::use_author(
  "Patrick",
  "Howard",
  email = "patrick.howard@noclocks.dev",
  role = c("aut", "rev")
)

usethis::use_author(
  "No Clocks, LLC",
  email = "team@noclocks.dev",
  role = c("cph", "fnd")
)

usethis::use_package_doc(open = FALSE)
usethis::use_import_from("rlang", c(".data", ".env"))
usethis::use_import_from("glue", "glue")
usethis::use_tibble()
attachment::att_amend_desc()
devtools::document()

usethis::use_git()



usethis::use_directory("dev", TRUE)
usethis::use_namespace()
usethis::use_roxygen_md()
usethis::use_readme_md()
usethis::use_proprietary_license("No Clocks, LLC")
usethis::use_git()

