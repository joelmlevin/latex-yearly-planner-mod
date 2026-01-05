# Quick Start - Build Your Modified Planner

## TL;DR

```bash
# 1. Install dependencies (one time only)
# macOS:
brew install go
brew install --cask mactex-no-gui

# Linux:
sudo apt install golang-go texlive-xetex texlive-latex-extra

# 2. Build planner
cd /home/user/latex-yearly-planner-mod

PLANNER_YEAR=2026 \
PASSES=2 \
CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/sn_a5x.breadcrumb.default.yaml" \
NAME="my_planner_2026" \
./single.sh

# 3. Done! Your PDF is: my_planner_2026.pdf
```

---

## What You Get

Your modified planner has updated **single day pages only**:

- ✅ **Focus bar at top** — 3 columns for your "Big Three" priorities
- ✅ **Hours 6-20** — 15 hours (instead of 7-23)
- ✅ **6 task checkboxes** — Under "Tasks" section
- ✅ **23 note lines** — Clean spacing

Everything else (weekly, monthly, quarterly, annual pages) is unchanged.

---

## Common Variations

### Different Years
```bash
# For 2027
PLANNER_YEAR=2027 NAME="planner_2027" ./single.sh
```

### Different Template Styles
```bash
# Breadcrumb navigation (recommended)
CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/sn_a5x.breadcrumb.default.yaml"

# Months-on-side navigation
CFG="cfg/base.yaml,cfg/template_months_on_side.yaml,cfg/sn_a5x.mos.default.yaml"

# With calendar below schedule
CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/sn_a5x.breadcrumb.default.dailycal.yaml"
```

### Quick Test Build
```bash
# Faster build for testing (only generates preview)
PLANNER_YEAR=2026 \
PREVIEW=1 \
PASSES=1 \
CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/sn_a5x.breadcrumb.default.yaml" \
NAME="test" \
./single.sh
```

---

## Troubleshooting

**"xelatex: command not found"**
→ Install LaTeX (see step 1 above)

**"go: command not found"**
→ Install Go (see step 1 above)

**PDF is incomplete**
→ Use `PASSES=2` instead of `PASSES=1`

---

For detailed instructions (TeXShop, VS Code, Overleaf, etc.), see [BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md)
