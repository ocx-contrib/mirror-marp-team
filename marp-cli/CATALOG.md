---
title: Marp CLI
description: Convert Markdown slide decks into HTML, PDF, PowerPoint and images
keywords: marp,markdown,slides,presentation,slide-deck,pdf,pptx,html,cli
---

# Marp CLI

Marp CLI converts Markdown written for [Marp](https://marp.app/) — the
Markdown Presentation Ecosystem — into slide decks. A deck is plain Markdown
with `---` separating slides and front-matter directives for theme, size and
pagination. Output formats are HTML, PDF, PowerPoint (`.pptx`) and PNG/JPEG
images, with a watch mode and a built-in server for live preview.

## What's included

- **marp** — the Marp CLI as a self-contained executable that bundles its
  Node.js runtime (no system Node required)

## Requirements

HTML output works out of the box. PDF, PPTX and image output drive a headless
browser: Marp looks for an installed Chrome, Chromium, Edge or Firefox, or the
path set in `CHROME_PATH`.

On Linux the binary links `libatomic.so.1`, which minimal images do not ship
(`apt-get install libatomic1` / `dnf install libatomic`).

## Links

- [Marp](https://marp.app/)
- [Marp CLI on GitHub](https://github.com/marp-team/marp-cli)
