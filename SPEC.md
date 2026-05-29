# SPEC — nix-vicinity

## §G GOAL

Standalone Nix package for [vicinity](https://github.com/MinishLab/vicinity) — lightweight vector store with flexible backends. Pre-built via cachix (`pr0d1r2.cachix.org`). Consumed as flake input by downstream repos (nix-model2vec, nix-semble, etc.).

## §C CONSTRAINTS

- C1: Nix flake, pinned `nixos-25.11`
- C2: 4 systems: aarch64-darwin, x86_64-darwin, x86_64-linux, aarch64-linux
- C3: Source pinned as `flake = false` input
- C4: Python build via `buildPythonPackage` — setuptools backend
- C5: Core deps: numpy, orjson, tqdm
- C6: cachix binary cache in `nixConfig`
- C7: 6 nix-lefthook inputs w/ follows deduplication
- C8: ⊥ embedded shell in nix — extract to fragments/

## §I INTERFACES

- I.pkg: `packages.<system>.default` — vicinity Python package
- I.dev: `devShells.<system>.default` — dev environment w/ vicinity + linters + lefthook
- I.flake-input: `inputs.nix-vicinity.url = "github:pr0d1r2/nix-vicinity"` w/ `nixpkgs.follows`

## §V VERSIONING

- vicinity version: pinned in vicinity.nix (currently 0.4.4)
- Bump: update `vicinity-src` input URL tag + version in vicinity.nix

## §T TESTING

- T1: `nix flake check` — evaluates package + devShell for all systems
- T2: `pythonImportsCheck` validates import
- T3: lefthook pre-commit quality gates

## §B BUILD

- B1: `nix build` — builds vicinity for current system
- B2: `nix develop` — enters dev shell
- B3: cachix push: `nix build && cachix push pr0d1r2 result`
