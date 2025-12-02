# Nature News & Views LaTeX Template

This repository contains a minimal LaTeX template for writing a
**Nature News & Views**–style article. The layout is: 9 pt body text, 3-column main body, simple title block, standfirst (summary paragraph), and references.

Have a look at [the sample PDF](main.pdf) and see if you like. A typical workflow involves:

1. cd to this directory and issue `make watch`. This will update the PDF everytime you change one of the files (i.e. Overleaf for free, locally running).
2. Edit `definitions.tex` with the relevant metadata (author, title etc).
3. Write `meat.tex` with your article.
4. Update `refs.bib` with the appropriate references.
5. Once you are happy with your article, `make docx`, inspect the resulting word document and send it to Nature.

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

- `make docx`  
  Builds `main.docx` using pandoc, after building PDF.

- `make clean`  
  Remove auxiliary build files (`.aux`, `.log`, `.toc`, etc.).

- `make distclean`  
  Remove auxiliary files **and** the generated `main.pdf`.

- `make help`  
  Show a summary of available make targets.

## Requirements

(1) A reasonably recent TeX distribution (e.g. TeX Live, MacTeX, MiKTeX).

(2) `lualatex` (LuaLaTeX) — required because the template uses `fontspec`.

(3) Recommended packages (usually included in full TeX distributions):`extarticle` (extsizes), `fontspec`, `geometry`, `multicol`, `graphicx`, `caption`, `microtype`, `natbib`, `xcolor`, `hyperref`, `nature`, `latexmk` (for `make watch` and robust incremental recompilation).

Commands to install all required packages on a minimal installation with [Basic TeX](https://www.tug.org/mactex/morepackages.html):

```bash
sudo tlmgr update --self
sudo tlmgr install collection-latexrecommended collection-luatex collection-langportuguese collection-fontsrecommended
sudo tlmgr install babel hyphen-portuguese amsfonts amsmath graphics xcolor soul  pgf todonotes ifoddpage marginfix hyperref tikzsymbols  mdframed emoji fontspec luaotfload ifmtarg threeparttable tablefootnote wrapfig todonotes soul fontawesome xifthen revtex revtex4-1 epsf type1cm enumitem newtx fontaxes xstring dblfloatfix scalerel placeins subfigure tcolorbox pdfcol adjustbox titling zref needspace latexmk nature draftwatermark
```

(4) pandoc to generate the final word document for submission to Nature

```bash
brew install pandoc pandoc-crossref
```

## Disclaimer

This template was mostly produced by GPT-5.1-high with a few changes by a human. I provided the `Makefile` and detailed prompt, available in the first commit message. The template works. 
