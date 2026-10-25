# marp-cli/tests/smoke.star — asserts the contract, never prose.

MARP = "marp.exe" if ocx.target_platform.os == ocx.os.Windows else "marp"

# Keep any cache/config writes inside the sandbox; works in bare containers too.
ENV = {"HOME": ocx.scratch_root, "USERPROFILE": ocx.scratch_root}

# Tier 1 + 2: liveness + version SHAPE.
r_version = ocx.run(MARP, "--version", env = ENV)
expect.ok(r_version)
expect.matches(r_version.stdout, r"\d+\.\d+\.\d+")

# Tier 3: real conversion. HTML output needs no browser (PDF/PPTX/PNG do), so
# this runs offline on every leg. Two `---`-separated slides must render as two
# numbered <section>s — a computed result, not an echo of the input.
ocx.write_file("deck.md", "---\nmarp: true\n---\n\n# Alpha\n\n---\n\n# Beta\n")
r_conv = ocx.run(MARP, "--no-stdin", "deck.md", "-o", "deck.html", env = ENV)
expect.ok(r_conv)
html = ocx.read_file("deck.html")
expect.matches(html, r"<section[^>]*id=\"1\"")
expect.matches(html, r"<section[^>]*id=\"2\"")
expect.true("id=\"3\"" not in html)
