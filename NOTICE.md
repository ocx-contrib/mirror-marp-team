# NOTICE

This repository packages and redistributes upstream software published by the
[Marp team](https://github.com/marp-team). The Apache-2.0 license in
[`LICENSE`](LICENSE) covers the OCX pipeline files authored here. It does
**not** cover any upstream-derived asset — each package's redistributed bytes
carry their own license, recorded below.

Each package's logo is reproduced for catalog identification only, under
nominative fair use. The marks remain the property of their respective owners
and no endorsement is implied.

| Package | GHCR path | Upstream SPDX |
|---|---|---|
| `marp-cli` | `ghcr.io/ocx-contrib/marp-team/marp-cli` | `MIT` |

---

## `marp-cli`

Upstream: <https://github.com/marp-team/marp-cli>
Published to `ghcr.io/ocx-contrib/marp-team/marp-cli`.

| Component | SPDX | Holder |
|---|---|---|
| Marp CLI (`marp`) | **MIT** | Copyright (c) 2018 Marp team (marp-team@marp.app) |

Verified at the Phase 1.5 license gate:

```
$ gh api repos/marp-team/marp-cli/license --jq '.license.spdx_id'
MIT
```

Permissive; redistribution of the compiled artifact is granted provided the
copyright notice and permission notice are retained. The terms are those of
<https://github.com/marp-team/marp-cli/blob/main/LICENSE>.

The published artifact is a Node.js single-executable binary that embeds the
Node.js runtime and third-party npm packages under their own permissive
licenses, redistributed unmodified.

The Marp name and logo (from `marp-team/marp`, `website/public/assets/marp-logo.svg`)
are used for catalog identification under nominative fair use.

No modifications are made to any upstream artifact in this repository; they are
republished byte-for-byte inside an OCX bundle.
