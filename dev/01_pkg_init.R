
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

c(
  "dev/README.md",
  "dev/00_pkg_libs.R",
  "dev/01_pkg_init.R",
  "dev/02_pkg_devt.R",
  "dev/03_pkg_test.R",
  "dev/04_pkg_docs.R",
  "dev/05_pkg_data.R",
  "dev/06_pkg_build.R",
  "dev/07_pkg_check.R",
  "dev/08_pkg_install.R"
) |>
  purrr::walk(fs::file_create)

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

usethis::use_git()
usethis::use_github()
usethis::use_github_links()

usethis::use_spell_check()
cat(
  "if (requireNamespace(\"spelling\", quietly = TRUE)) {",
  "  spelling::spell_check_test(",
  "    vignettes = TRUE,",
  "    error = FALSE,",
  "    skip_on_cran = TRUE",
  "  )",
  "}",
  "",
  file = "tests/spelling.R",
  sep = "\n",
  append = FALSE
)
spelling::update_wordlist()

usethis::use_testthat()
usethis::use_test("gmhleasr")

devtools::test()

usethis::use_coverage(repo_spec = "noclocks/gmhleasr")
usethis::use_covr_ignore("dev/")

covr::codecov(
  token = Sys.getenv("CODECOV_TOKEN"),
  quiet = FALSE
)

lintr::use_lintr()
cat(
  "linters: linters_with_defaults(",
  "    line_length_linter(120),",
  "    commented_code_linter = NULL,",
  "    trailing_blank_lines_linter = NULL",
  "  )",
  "exclusions: list()",
  "encoding: \"UTF-8\"",
  "",
  file = ".lintr",
  sep = "\n",
  append = FALSE
)
usethis::use_build_ignore(".lintr")
lintr::lint_package()

# github actions ----------------------------------------------------------

usethis::use_github_action(
  name = "document",
  save_as = "roxygen.yml",
  badge = TRUE
)

usethis::use_github_action(
  name = "lint",
  save_as = "lint.yml",
  badge = TRUE
)

usethis::use_github_action(
  name = "pr-commands",
  save_as = "pull-requests.yml",
  badge = TRUE
)

usethis::use_github_action(
  name = "style",
  save_as = "style.yml",
  badge = TRUE
)

usethis::use_github_action(
  name = "test-coverage",
  save_as = "coverage.yml",
  badge = TRUE
)

usethis::use_github_action(
  name = "check-standard",
  save_as = "check.yml",
  badge = TRUE
)

fs::file_create(".github/workflows/changelog.yml")
fs::file_create("CHANGELOG.md")
usethis::use_build_ignore("CHANGELOG.md")


usethis::use_pkgdown_github_pages()


attachment::att_amend_desc()
devtools::document()

