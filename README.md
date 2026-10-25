# mirror-marp-team

OCX mirror for [Marp](https://github.com/marp-team) tooling. One repository,
one spec directory per package.

| Package | Spec | Publishes to | Announced as | Upstream SPDX |
|---|---|---|---|---|
| [marp-cli](https://github.com/marp-team/marp-cli) | [`marp-cli/mirror.yml`](marp-cli/mirror.yml) | `ghcr.io/ocx-contrib/marp-team/marp-cli` | `ocx.sh/marp-team/marp-cli` | `MIT` |

Each upstream release is discovered, re-bundled, smoke-tested per
`(version, platform)` and only then pushed with cascade tags, after which the
result is announced into the OCX index.

## Layout

```
mirror-base.yml         repo-wide policy every spec inherits via `extends:`
marp-cli/
├── mirror.yml          the spec — never at the repo root
├── metadata.json       bundle interface
├── CATALOG.md          → ocx package describe
├── logo.svg / logo.png describe assets, 512px PNG
└── tests/smoke.star    Starlark smoke test
```

⚠️ `extends:` is a **shallow** merge of top-level keys — restate a block in
full or not at all.

## Platforms

`linux/amd64+libc.glibc`, `linux/arm64+libc.glibc` (from 4.4.0),
`darwin/arm64`, `windows/amd64` — everything upstream ships. No Intel macOS,
no Windows arm64 and no musl build exist upstream. The Linux binaries are
dynamically linked against glibc and need `libatomic.so.1`; the container legs
install it via `containers[].setup`. Evidence sits above `assets:` in the spec.

## Editing

| File | Edit | Regenerate after |
|------|------|------------------|
| `mirror-base.yml`, `marp-cli/mirror.yml` | hand | yes — see below |
| `marp-cli/{metadata.json,CATALOG.md,logo.*}` | hand | — |
| `marp-cli/tests/smoke.star` | hand | — |
| `.github/workflows/*.yml` (ocx-mirror) | **generated — never hand-edit** | re-run when a spec changes |

```bash
ocx-mirror package pipeline generate ci --spec marp-cli/mirror.yml
```

**Name every spec** — `--spec` appends. `verify-generated.yml` exits 65 on
drift. Run `direnv allow` once and invoke `ocx-mirror` directly, never via
`ocx run --`.

## Required secrets

`OCX_ANNOUNCE_TOKEN` and `OCX_MIRROR_DISCORD_HOOK`, inherited from the
`ocx-contrib` org. GHCR pushes use the run's own `GITHUB_TOKEN`.

## License

Apache-2.0 — see [`LICENSE`](LICENSE). Upstream licenses are recorded in
[`NOTICE.md`](NOTICE.md).
