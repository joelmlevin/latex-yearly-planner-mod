# How to Build Your Modified Planner PDF

## Prerequisites

You need two things installed:
1. **Go** (programming language) - to generate LaTeX files
2. **XeLaTeX** (LaTeX distribution) - to compile PDF

---

## Method 1: Command Line (Bash) - Recommended

### Step 1: Install Dependencies

**On macOS:**
```bash
# Install Go (if not already installed)
brew install go

# Install LaTeX (MacTeX includes XeLaTeX)
brew install --cask mactex-no-gui
# OR for full MacTeX with GUI apps:
brew install --cask mactex
```

**On Linux (Ubuntu/Debian):**
```bash
# Install Go
sudo apt update
sudo apt install golang-go

# Install XeLaTeX
sudo apt install texlive-xetex texlive-latex-extra
```

**On Windows:**
- Download Go from: https://go.dev/dl/
- Download MiKTeX from: https://miktex.org/download

### Step 2: Navigate to Project Directory
```bash
cd /home/user/latex-yearly-planner-mod
# Or wherever you cloned the repository
```

### Step 3: Build the Planner

**For 2026 planner:**
```bash
PLANNER_YEAR=2026 \
PASSES=2 \
CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/sn_a5x.breadcrumb.default.yaml" \
NAME="my_planner_2026" \
./single.sh
```

**For 2027 planner:**
```bash
PLANNER_YEAR=2027 \
PASSES=2 \
CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/sn_a5x.breadcrumb.default.yaml" \
NAME="my_planner_2027" \
./single.sh
```

### Step 4: Find Your PDF

The PDF will be created in the current directory:
```bash
ls -lh my_planner_2026.pdf
```

### Configuration Options

**Different template styles:**

Breadcrumb navigation (recommended):
```bash
CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/sn_a5x.breadcrumb.default.yaml"
```

Months-on-side navigation:
```bash
CFG="cfg/base.yaml,cfg/template_months_on_side.yaml,cfg/sn_a5x.mos.default.yaml"
```

With daily calendar below schedule:
```bash
CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/sn_a5x.breadcrumb.default.dailycal.yaml"
```

**Different devices:**

For reMarkable 2:
```bash
CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/rm2.breadcrumb.default.yaml"
```

For Supernote A6 X:
```bash
CFG="cfg/base.yaml,cfg/template_months_on_side.yaml,cfg/sn_a6x.mos.default.yaml"
```

---

## Method 2: TeXShop (macOS LaTeX Editor)

### Step 1: Generate LaTeX Files

First, use the command line to generate the `.tex` files:

```bash
cd /home/user/latex-yearly-planner-mod

PLANNER_YEAR=2026 \
PREVIEW=1 \
CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/sn_a5x.breadcrumb.default.yaml" \
./single.sh
```

This creates LaTeX files in the `out/` directory without trying to compile the PDF.

### Step 2: Open in TeXShop

1. Open **TeXShop** (install from https://pages.uoregon.edu/koch/texshop/ if needed)
2. Go to **File → Open** and navigate to:
   ```
   /home/user/latex-yearly-planner-mod/out/sn_a5x.breadcrumb.default.tex
   ```
3. In TeXShop, change the engine to **XeLaTeX**:
   - Look for the dropdown menu near the "Typeset" button
   - Select "XeLaTeX" (not "LaTeX" or "pdfLaTeX")

### Step 3: Compile

1. Click the **Typeset** button (or press ⌘T)
2. Wait for compilation (may take 2-3 minutes)
3. TeXShop will show the PDF preview
4. Click **Typeset** again for a second pass (fixes cross-references)

### Step 4: Save PDF

The compiled PDF is in:
```
/home/user/latex-yearly-planner-mod/out/sn_a5x.breadcrumb.default.pdf
```

---

## Method 3: Overleaf (Online LaTeX Editor)

### Step 1: Generate LaTeX Files Locally

```bash
cd /home/user/latex-yearly-planner-mod

PLANNER_YEAR=2026 \
PREVIEW=1 \
CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/sn_a5x.breadcrumb.default.yaml" \
./single.sh
```

### Step 2: Create Overleaf Project

1. Go to https://www.overleaf.com
2. Create a new blank project
3. Upload all files from the `out/` directory:
   - `sn_a5x.breadcrumb.default.tex` (main file)
   - `annual.tex`
   - `quarterly.tex`
   - `monthly.tex`
   - `weekly.tex`
   - `daily.tex`
   - `daily_notes.tex`
   - `daily_reflect.tex`
   - `notes.tex`
   - `todos.tex`

### Step 3: Set Compiler

1. Click the **Menu** button (top left)
2. Under **Settings**, change **Compiler** to **XeLaTeX**

### Step 4: Compile

Click **Recompile** and wait for the PDF to generate.

**Note:** Overleaf free tier may time out on large planners. Premium account recommended.

---

## Method 4: Visual Studio Code with LaTeX Workshop

### Step 1: Install VS Code Extensions

1. Install **Visual Studio Code**: https://code.visualstudio.com/
2. Install the **LaTeX Workshop** extension:
   - Open VS Code
   - Press `Ctrl+Shift+X` (or `Cmd+Shift+X` on Mac)
   - Search for "LaTeX Workshop"
   - Click Install

### Step 2: Install LaTeX Distribution

Follow Method 1 (Step 1) to install XeLaTeX for your OS.

### Step 3: Generate LaTeX Files

```bash
cd /home/user/latex-yearly-planner-mod

PLANNER_YEAR=2026 \
PREVIEW=1 \
CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/sn_a5x.breadcrumb.default.yaml" \
./single.sh
```

### Step 4: Configure LaTeX Workshop for XeLaTeX

Create or edit `.vscode/settings.json` in your project:

```json
{
  "latex-workshop.latex.recipes": [
    {
      "name": "XeLaTeX",
      "tools": ["xelatex"]
    }
  ],
  "latex-workshop.latex.tools": [
    {
      "name": "xelatex",
      "command": "xelatex",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "%DOC%"
      ]
    }
  ]
}
```

### Step 5: Build PDF

1. Open `out/sn_a5x.breadcrumb.default.tex` in VS Code
2. Press `Ctrl+Alt+B` (or `Cmd+Option+B` on Mac) to build
3. Or click the **Build LaTeX project** button in the sidebar
4. View PDF by clicking the **View LaTeX PDF** button

---

## Method 5: RStudio (Not Recommended)

RStudio can compile LaTeX, but it's designed for `.Rnw` files (R + LaTeX), not pure LaTeX projects. However:

### If you really want to use RStudio:

1. Generate LaTeX files using bash (Method 1, Step 3)
2. In RStudio, install TinyTeX:
   ```r
   install.packages('tinytex')
   tinytex::install_tinytex()
   ```
3. Open the generated `.tex` file
4. Click **Compile PDF** button

**However**, RStudio's TinyTeX may not have all packages. You'll likely need to install:
```r
tinytex::tlmgr_install(c("babel-german", "hyphen-german", "xcolor", "geometry"))
```

**Better alternative:** Use VS Code (Method 4) which has better LaTeX support.

---

## Troubleshooting

### Error: "xelatex: command not found"

**Solution:** Install a LaTeX distribution (see Method 1, Step 1).

### Error: "Missing LaTeX packages"

**On macOS/Linux:**
```bash
sudo tlmgr install <package-name>
```

**Common missing packages:**
- `babel-german`
- `hyphen-german`
- `xcolor`
- `geometry`
- `hyperref`

### Error: "Go: command not found"

**Solution:** Install Go (see Method 1, Step 1).

### Compilation takes forever or times out

**Solution:** Use fewer passes:
```bash
PASSES=1 ./single.sh
```

Or compile only a preview (fewer days):
```bash
PREVIEW=1 ./single.sh
```

### PDF is blank or incomplete

**Solution:** Run compilation twice (PASSES=2) to resolve cross-references.

---

## Quick Reference Card

### Most Common Command

```bash
cd /path/to/latex-yearly-planner-mod

PLANNER_YEAR=2026 \
PASSES=2 \
CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/sn_a5x.breadcrumb.default.yaml" \
NAME="planner_2026" \
./single.sh
```

### Variables Explained

- `PLANNER_YEAR=2026` — Which year to generate
- `PASSES=2` — Compile twice (fixes references)
- `CFG="..."` — Which config files to layer (comma-separated)
- `NAME="..."` — Output filename (creates `planner_2026.pdf`)
- `PREVIEW=1` — (Optional) Generate preview with fewer days

### Output Locations

- Generated LaTeX: `out/*.tex`
- Generated PDF (with NAME): `planner_2026.pdf` (in current directory)
- Generated PDF (without NAME): `sn_a5x.breadcrumb.default.pdf` (in current directory)

---

## What Changed in Your Planner

Your modified single day pages now have:

```
┌─────────────────────────────────────────────┐
│  DATE & NAVIGATION                          │
├─────────────────────────────────────────────┤
│  Focus                                      │
│  ──────────────────────────────────────     │
│  ───────────│───────────│────────────       │  ← 3 columns
│  ───────────│───────────│────────────       │    for Big Three
│  ───────────│───────────│────────────       │
├───────────┬─────────────────────────────────┤
│ Schedule  │  Tasks                          │
│ ────────  │  □ ──────────────────           │
│  6 ────   │  □ ──────────────────           │
│  7 ────   │  □ ──────────────────           │
│  ...      │  □ ──────────────────           │
│ 20 ────   │  □ ──────────────────           │
│           │  □ ──────────────────           │
│           │                                 │
│           │  Notes | More  Reflect  All     │
│           │  ─────────────────────────────  │
│           │  ...23 lines...                 │
└───────────┴─────────────────────────────────┘
```

All other pages (weekly, monthly, etc.) remain unchanged.

---

## Need Help?

- Check existing issues: https://github.com/kudrykv/latex-yearly-planner/issues
- LaTeX documentation: https://www.latex-project.org/help/documentation/
- Go installation: https://go.dev/doc/install
