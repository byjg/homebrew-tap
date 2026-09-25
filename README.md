# ByJG Homebrew Tap

[![Opensource ByJG](https://img.shields.io/badge/opensource-byjg-success.svg)](http://opensource.byjg.com)
[![GitHub source](https://img.shields.io/badge/Github-source-informational?logo=github)](https://github.com/byjg/homebrew-tap/)
[![GitHub license](https://img.shields.io/github/license/byjg/homebrew-tap.svg)](https://opensource.byjg.com/license/)

[Homebrew](https://brew.sh) formulas for ByJG command-line tools, on macOS and
Linux.

## Install

```bash
brew install byjg/tap/<formula>
```

`brew` adds this tap automatically the first time. To add it explicitly:

```bash
brew tap byjg/tap
```

## Formulas

| Formula | Description |
|---|---|
| [`parolsh`](https://opensource.byjg.com/docs/ai/parolsh) | Speak to your terminal: a natural-language-first shell for ACP agents |
| [`static-httpserver`](https://github.com/byjg/docker-static-httpserver) | Minimal HTTP/HTTPS server for static files with SPA support |

Every formula builds from source on your machine: Homebrew installs the
compiler (Rust or Go) as a build dependency, compiles, and runs the formula's
test. The binary is built locally, so macOS does not quarantine it and no
code signing is needed.

On Linux, the same tools are also available as `.deb` and `.rpm` packages from
the [ByJG package repository](https://opensource.byjg.com/docs/packages).

## New versions

Nothing to do after a release. Every day, the
[Update formulas](.github/workflows/update.yml) workflow:

1. runs `brew livecheck` to find formulas whose project has a newer release tag;
2. rewrites `url` and `sha256` for the new tag (`brew bump-formula-pr --write-only`);
3. builds it from source, runs `brew test` and `brew audit --strict --online`;
4. commits the updated formulas.

If any updated formula fails to build, test or audit, nothing is committed and
the run fails.
To update right away, run the workflow from the Actions tab
(**Run workflow**).

The same steps run locally with `.github/scripts/update-formulas.sh`.

## Adding a formula

Add `Formula/<name>.rb` building from the source archive of a release tag,
with a `test do` block, then check it:

```bash
brew install --build-from-source byjg/tap/<name>
brew test byjg/tap/<name>
brew audit --strict --online --new byjg/tap/<name>
```

----
[Open source ByJG](http://opensource.byjg.com)
