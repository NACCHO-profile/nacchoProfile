# nacchoProfile 0.0.1.9000

## Internal changes

* Data files (`data/`) and raw derivation scripts (`data-raw/`) are now
  provided as Git submodules pointing at private repositories under the
  `NACCHO-profile` organization. This keeps the compiled datasets out of the
  public repository history while allowing the package to load them as
  lazy-loaded datasets.

* Repository moved from `madocalder/nacchoProfile` to
  `NACCHO-profile/nacchoProfile`.

* R-CMD-check and PR-command workflows now fetch the private submodules
  using the `SUBMODULE_PAT` repository secret. Fork pull requests skip
  R-CMD-check because secrets are unavailable to fork-triggered workflows.

## Documentation

* Updated `README.md` setup instructions covering organization access, SSH
  key configuration, submodule cloning, dependency restore, and
  shinyapps.io deployment.

* Added `CONTRIBUTING.md` with first-time setup, PR workflow, and submodule
  update guidance.

* Documented `meta` and other datasets in `R/document_data.R`.

## Bug fixes

* Fixed `add_all_counts_long()` example so it no longer fails during
  `R CMD check`.

* Added `meta` to `utils::globalVariables()` to silence "no visible binding"
  notes.

* Removed unused `stats`, `usmap`, and `utils` from `Imports:`.

* Fixed unescaped braces in `viz_options` documentation.

## Initial release

* Shiny dashboard visualizing NACCHO's National Profile of Local Health
  Departments.
