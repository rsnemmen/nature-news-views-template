# Nature News & Views LaTeX Template

This repository contains a minimal LuaLaTeX template for writing a
**Nature News & Views**–style article.

The layout is:

- 9 pt body text
- 3-column main body
- Simple title block, standfirst (summary paragraph), and references

## Files

- `main.tex` — top-level file; orchestrates title block and three-column layout.
- `definitions.tex` — all package imports, layout settings, and metadata macros
  (title, authors, affiliations, correspondence, etc.).
- `meat.tex` — the main body of the article (the “meat” of your text).
- `Makefile` — convenient build commands using LuaLaTeX (and `latexmk` if available).
- `README.md` — this file.

## How to build

From the directory containing `main.tex` and the `Makefile`:

- `make` or `make pdf`  
  Build `main.pdf` (uses `latexmk` if installed, otherwise runs `lualatex` twice).

- `make watch`  
  Continuous recompilation on file changes (requires `latexmk`).

- `make open`  
  Open `main.pdf` (uses `open` on macOS; adjust if needed on other systems).

- `make clean`  
  Remove auxiliary build files (`.aux`, `.log`, `.toc`, etc.).

- `make distclean`  
  Remove auxiliary files **and** the generated `main.pdf`.

- `make help`  
  Show a summary of available make targets.

### Requirements

- A reasonably recent TeX distribution (e.g. TeX Live, MacTeX, MiKTeX).
- `lualatex` (LuaLaTeX) — required because the template uses `fontspec`.
- Recommended packages (usually included in full TeX distributions):
  - `extarticle` (extsizes)
  - `fontspec`
  - `geometry`
  - `multicol`
  - `graphicx`
  - `caption`
  - `microtype`
  - `natbib`
  - `xcolor`
  - `hyperref`
- Optional: `latexmk` (for `make watch` and robust incremental recompilation).

## What you should edit

### 1. Article metadata (`definitions.tex`)

In `definitions.tex`, edit these macros to match your article:

```tex
\newcommand{\articletitle}{Concise, informative title in sentence case}
\newcommand{\articlesubtitle}{Optional standfirst-style subtitle (can be left empty)}
\newcommand{\articleauthors}{%
First A. Author$^{1}$ and Second B. Author$^{2}$%
}
\newcommand{\articleaffiliations}{%
$^{1}$Department, Institution, City, Country\\%
$^{2}$Department, Institution, City, Country%
}
\newcommand{\articlecorrespondence}{%
Correspondence to: First A. Author (\href{mailto:first.author@example.com}{first.author@example.com})%
}