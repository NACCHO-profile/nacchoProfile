# Contributing to nacchoProfile

## First-time setup

```sh
git clone --recurse-submodules git@github.com:NACCHO-profile/nacchoProfile.git
cd nacchoProfile
```

You must have read access to `NACCHO-profile/nacchoProfile_data` and
`NACCHO-profile/nacchoProfile_dataraw`. If `git submodule update` fails with
`Repository not found`, request access from a maintainer.

## R environment

This project uses `renv`. After cloning:

```r
renv::restore()
```

## Making changes

- Edit source files under `R/`, then run `devtools::document()` to regenerate
  `man/` and `NAMESPACE`.
- Run `devtools::check()` before opening a PR. CI runs R-CMD-check on all
  supported platforms.
- Do not commit changes to `data/` or `data-raw/` directly. Those are
  submodules; update them by committing in the respective private repo and
  bumping the submodule pointer here.

## CI note for pull requests

The R-CMD-check workflow requires the `SUBMODULE_PAT` repository secret to
fetch the private submodules. Maintainers configure this once under
**Settings → Secrets and variables → Actions**. PRs from forks will not
automatically have access; a maintainer must approve the workflow run.
