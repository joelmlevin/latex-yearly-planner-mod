# Single Day Planner Layout Options

## Current vs Proposed Changes

**Current Configuration:**
- Hours: 7–23 (17 hours)
- Top Priorities: 8 items
- Layout: 1/3 schedule + 2/3 priorities/notes

**All Options Share These Changes:**
- Hours: **6–20** (15 hours) → saves ~2cm vertical space
- Top Priorities: **3** items → saves ~2.5cm vertical space
- **Total space saved: ~4.5cm** to reallocate
- Optimized for **A5 paper** (15.6cm × 20.9cm)

---

## Option 1: Enhanced Left Column with Habit Trackers

### Visual Layout
```
┌─────────────────────────────────────────────────┐
│                                                 │
│  ┌──────────┐  ┌──────────────────────────┐   │
│  │          │  │                          │   │
│  │ Schedule │  │   Top Priorities (3)     │   │
│  │          │  │                          │   │
│  │ 6-20     │  ├──────────────────────────┤   │
│  │ (15hrs)  │  │                          │   │
│  │          │  │                          │   │
│  │          │  │                          │   │
│  ├──────────┤  │                          │   │
│  │          │  │        Notes             │   │
│  │ Habits   │  │       (~27 lines)        │   │
│  │ (3)      │  │                          │   │
│  ├──────────┤  │                          │   │
│  │ Water    │  │                          │   │
│  │ Tracker  │  │                          │   │
│  └──────────┘  └──────────────────────────┘   │
│       33%                 67%                  │
└─────────────────────────────────────────────────┘
```

### Template Code (_common_05_daily.tpl)
```latex
{{- $today := .Body.Day -}}

\begin{minipage}[t]{\myLenTriCol}
{{template "schedule.tpl" dict "Cfg" .Cfg "Day" .Body.Day}}
  \vspace{\dimexpr4mm+.3pt}

  {{- if .Cfg.CalAfterSchedule -}}
  {{- template "monthTabularV2.tpl" dict "Month" .Body.Month "Today" $today -}}
  {{- else -}}
  %% NEW: Habits section
  \myUnderline{Habits}
  \myLineHeightButLine$\square$ Exercise\myLineGray
  \vskip\myLenLineHeightButLine
  \myLineHeightButLine$\square$ Meditate\myLineGray
  \vskip\myLenLineHeightButLine
  \myLineHeightButLine$\square$ Read\myLineGray

  \vspace{2mm}

  %% NEW: Water tracker
  \myUnderline{Water (8 glasses)}
  {\small $\circ$ $\circ$ $\circ$ $\circ$ $\circ$ $\circ$ $\circ$ $\circ$}
  {{- end -}}
\end{minipage}%
\hspace{\myLenTriColSep}%
\begin{minipage}[t]{\dimexpr2\myLenTriCol+\myLenTriColSep}
  \myUnderline{Top priorities\myDummyQ}
  \Repeat{\myNumDailyTodos}{\myTodoLineGray}
  \vskip\dimexpr5.4mm
  \myUnderline{Notes $\vert$ {{ $today.LinkLeaf "More" "More" }}\hfill{}{{ $today.LinkLeaf "Reflect" "Reflect" }}\hfill{}\hyperlink{Notes Index}{All notes}}
  \myMash[\myDailySpring]{\myNumDailyNotes}{\myNumDotWidthTwoThirds}
\end{minipage}
\par\pagebreak
```

### Configuration (cfg/base.yaml)
```yaml
layout:
  numbers:
    dailytodos: 3          # Changed from 8
    dailybottomhour: 6     # Changed from 7
    dailytophour: 20       # Changed from 23
    dailynotes: 27         # Increased from 25 (more space available)
```

**Pros:**
- Adds practical daily habit and wellness tracking
- Maintains familiar 1/3–2/3 column structure
- Good use of saved vertical space

**Cons:**
- Left column becomes denser
- May feel cramped if calendar is also shown

---

## Option 2: Wider Schedule Column (40/60 split)

### Visual Layout
```
┌─────────────────────────────────────────────────┐
│                                                 │
│  ┌──────────────┐  ┌──────────────────────┐   │
│  │              │  │                      │   │
│  │  Schedule    │  │  Top 3 Priorities    │   │
│  │              │  │                      │   │
│  │  6-20        │  ├──────────────────────┤   │
│  │  (15 hrs)    │  │                      │   │
│  │              │  │      Tasks (5)       │   │
│  │              │  │                      │   │
│  │              │  ├──────────────────────┤   │
│  ├──────────────┤  │                      │   │
│  │              │  │                      │   │
│  │ Daily Check  │  │       Notes          │   │
│  │ Mood/Energy  │  │      (~20 lines)     │   │
│  │ Sleep        │  │                      │   │
│  │              │  │                      │   │
│  └──────────────┘  └──────────────────────┘   │
│       40%                   60%                │
└─────────────────────────────────────────────────┘
```

### Template Code (_common_05_daily.tpl)
```latex
{{- $today := .Body.Day -}}

%% NEW: Custom column widths
\newlength{\myLenLeftWide}
\newlength{\myLenRightWide}
\setlength{\myLenLeftWide}{\dimexpr.4\linewidth-.5\myLenTriColSep}
\setlength{\myLenRightWide}{\dimexpr.6\linewidth-.5\myLenTriColSep}

\begin{minipage}[t]{\myLenLeftWide}
{{template "schedule.tpl" dict "Cfg" .Cfg "Day" .Body.Day}}
  \vspace{\dimexpr4mm+.3pt}

  %% NEW: Daily wellness check
  \myUnderline{Daily Check}
  {\small
  Mood: $\bigcirc$ $\bigcirc$ $\bigcirc$ $\bigcirc$ $\bigcirc$

  \vspace{1mm}
  Energy: $\bigcirc$ $\bigcirc$ $\bigcirc$ $\bigcirc$ $\bigcirc$

  \vspace{1mm}
  Sleep: \rule{2.5cm}{0.4pt} hrs
  }
\end{minipage}%
\hspace{\myLenTriColSep}%
\begin{minipage}[t]{\myLenRightWide}
  \myUnderline{Top 3 Priorities\myDummyQ}
  \Repeat{\myNumDailyTodos}{\myTodoLineGray}

  \vskip\dimexpr5.4mm

  %% NEW: Additional tasks section
  \myUnderline{Tasks}
  \Repeat{5}{\myTodoLineGray}

  \vskip\dimexpr5.4mm

  \myUnderline{Notes $\vert$ {{ $today.LinkLeaf "More" "More" }}\hfill{}{{ $today.LinkLeaf "Reflect" "Reflect" }}\hfill{}\hyperlink{Notes Index}{All notes}}
  \myMash[\myDailySpring]{20}{\myNumDotWidthTwoThirds}
\end{minipage}
\par\pagebreak
```

### Configuration (cfg/base.yaml)
```yaml
layout:
  numbers:
    dailytodos: 3          # Changed from 8
    dailybottomhour: 6     # Changed from 7
    dailytophour: 20       # Changed from 23
```

**Pros:**
- More breathing room for schedule entries (wider column)
- Adds wellness tracking (mood, energy, sleep)
- Separates priorities from general tasks
- Better balance for A5 paper size

**Cons:**
- Slightly less notes space (20 vs 27 lines)
- Requires custom column width definitions

---

## Option 3: Horizontal Priority Bar at Top

### Visual Layout
```
┌─────────────────────────────────────────────────┐
│                                                 │
│  ┌──────────────────────────────────────────┐  │
│  │     Today's Top 3 Priorities             │  │
│  └──────────────────────────────────────────┘  │
│                                                 │
│  ┌──────────┐  ┌──────────────────────────┐   │
│  │          │  │                          │   │
│  │ Schedule │  │  Tasks & Reminders (8)   │   │
│  │          │  │                          │   │
│  │ 6-20     │  ├──────────────────────────┤   │
│  │ (15hrs)  │  │                          │   │
│  │          │  │                          │   │
│  │          │  │        Notes             │   │
│  │          │  │      (~20 lines)         │   │
│  │          │  │                          │   │
│  │          │  │                          │   │
│  └──────────┘  └──────────────────────────┘   │
│       33%                 67%                  │
└─────────────────────────────────────────────────┘
```

### Template Code (_common_05_daily.tpl)
```latex
{{- $today := .Body.Day -}}

%% NEW: Full-width priority bar at top
\myUnderline{Today's Top 3 Priorities}
\Repeat{\myNumDailyTodos}{\myTodoLineGray}

\vspace{4mm}

%% Standard two-column layout below
\begin{minipage}[t]{\myLenTriCol}
{{template "schedule.tpl" dict "Cfg" .Cfg "Day" .Body.Day}}
  \vspace{\dimexpr4mm+.3pt}

{{- if .Cfg.CalAfterSchedule -}}
{{- template "monthTabularV2.tpl" dict "Month" .Body.Month "Today" $today -}}
{{- end -}}
\end{minipage}%
\hspace{\myLenTriColSep}%
\begin{minipage}[t]{\dimexpr2\myLenTriCol+\myLenTriColSep}
  \myUnderline{Tasks \& Reminders}
  \Repeat{8}{\myTodoLineGray}

  \vskip\dimexpr5.4mm

  \myUnderline{Notes $\vert$ {{ $today.LinkLeaf "More" "More" }}\hfill{}{{ $today.LinkLeaf "Reflect" "Reflect" }}\hfill{}\hyperlink{Notes Index}{All notes}}
  \myMash[\myDailySpring]{20}{\myNumDotWidthTwoThirds}
\end{minipage}
\par\pagebreak
```

### Configuration (cfg/base.yaml)
```yaml
layout:
  numbers:
    dailytodos: 3          # Changed from 8
    dailybottomhour: 6     # Changed from 7
    dailytophour: 20       # Changed from 23
```

**Pros:**
- Strong visual emphasis on priorities (full width, at top)
- Clean separation of priorities vs tasks
- Priorities immediately visible when opening page

**Cons:**
- Priorities not co-located with tasks (may reduce workflow efficiency)
- Uses more vertical space at top, less for schedule area
- Less notes space

---

## Option 4: Minimal + Spacious with Time Blocks

### Visual Layout
```
┌─────────────────────────────────────────────────┐
│                                                 │
│  ┌──────────┐  ┌──────────────────────────┐   │
│  │          │  │                          │   │
│  │ Schedule │  │   Focus for Today (3)    │   │
│  │          │  │                          │   │
│  │ 6:00     │  ├──────────────────────────┤   │
│  │ ...      │  │                          │   │
│  │ 8:00     │  │  Additional Tasks (4)    │   │
│  │ 8:30 ←─  │  │                          │   │
│  │ 9:00     │  ├──────────────────────────┤   │
│  │ 9:30 ←─  │  │                          │   │
│  │ ...      │  │                          │   │
│  │ 20:00    │  │   Notes & Reflections    │   │
│  ├──────────┤  │      (~18 lines)         │   │
│  │  Quick   │  │                          │   │
│  │  Notes   │  │                          │   │
│  └──────────┘  └──────────────────────────┘   │
│       33%                 67%                  │
└─────────────────────────────────────────────────┘
```

### Template Code
**schedule.tpl (modified to add half-hour blocks for peak hours):**
```latex
\myUnderline{Schedule\textcolor{white}{g}}\vskip-\myLenLineThicknessDefault
{{range $hour := .Day.Hours .Cfg.Layout.Numbers.DailyBottomHour .Cfg.Layout.Numbers.DailyTopHour -}}
\myLineHeightButLine%
{{if $.Cfg.AMPMTime -}}
\parbox{9mm}{\hfill\small {{- $hour.FormatHour $.Cfg.AMPMTime -}} }%
{{- else -}}
{\small {{- $hour.FormatHour $.Cfg.AMPMTime -}} }
{{- end}}
\myLineLightGray\vskip\myLenLineHeightButLine\myLineGray
%% NEW: Add 30-min mark for peak hours (8-10)
{{- if and (ge $hour.Hour 8) (le $hour.Hour 9) }}
\vskip\myLenLineHeightButLine
{\small\hspace{3mm}{{- $hour.FormatHour $.Cfg.AMPMTime -}}:30}\myLineLightGray
{{- end}}
{{- end}}
```

**_common_05_daily.tpl:**
```latex
{{- $today := .Body.Day -}}

\begin{minipage}[t]{\myLenTriCol}
{{template "schedule.tpl" dict "Cfg" .Cfg "Day" .Body.Day}}
  \vspace{\dimexpr4mm+.3pt}

  %% NEW: Quick capture area
  \myUnderline{Quick Notes}
  \Repeat{3}{\vskip\myLenLineHeightButLine\myLineGray}
\end{minipage}%
\hspace{\myLenTriColSep}%
\begin{minipage}[t]{\dimexpr2\myLenTriCol+\myLenTriColSep}
  \myUnderline{Focus for Today\myDummyQ}
  \Repeat{\myNumDailyTodos}{\myTodoLineGray}

  \vskip\dimexpr7mm

  \myUnderline{Additional Tasks}
  \Repeat{4}{\myTodoLineGray}

  \vskip\dimexpr7mm

  \myUnderline{Notes \& Reflections $\vert$ {{ $today.LinkLeaf "More" "More" }}\hfill{}{{ $today.LinkLeaf "Reflect" "Reflect" }}\hfill{}\hyperlink{Notes Index}{All notes}}
  \myMash[\myDailySpring]{18}{\myNumDotWidthTwoThirds}
\end{minipage}
\par\pagebreak
```

### Configuration (cfg/base.yaml)
```yaml
layout:
  numbers:
    dailytodos: 3          # Changed from 8
    dailybottomhour: 6     # Changed from 7
    dailytophour: 20       # Changed from 23
```

**Pros:**
- Very clean, uncluttered, distraction-free design
- Half-hour blocks for peak morning hours (8:00–10:00)
- Generous spacing between sections
- Best for minimalists and focused work

**Cons:**
- Fewer total note lines (18 vs 25-27)
- May not suit heavy note-takers
- Requires modification to schedule.tpl

---

## Recommendation Summary

| Option | Best For | Complexity | Files to Modify |
|--------|----------|------------|-----------------|
| **Option 1** | Habit tracking enthusiasts | Low | 1 file |
| **Option 2** | Balanced users wanting wellness tracking | Medium | 1 file |
| **Option 3** | Priority-focused planning | Low | 1 file |
| **Option 4** | Minimal, distraction-free planning | Medium | 2 files |

---

## Implementation Steps

1. **Backup current configuration:**
   ```bash
   cp cfg/base.yaml cfg/base.yaml.backup
   cp tpls/_common_05_daily.tpl tpls/_common_05_daily.tpl.backup
   ```

2. **Update cfg/base.yaml** (all options):
   ```yaml
   layout:
     numbers:
       dailytodos: 3          # Changed from 8
       dailybottomhour: 6     # Changed from 7
       dailytophour: 20       # Changed from 23
   ```

3. **Update template file(s):**
   - Options 1-3: Modify only `tpls/_common_05_daily.tpl`
   - Option 4: Modify both `tpls/_common_05_daily.tpl` and `tpls/schedule.tpl`

4. **Test build:**
   ```bash
   PLANNER_YEAR=2026 \
   PASSES=1 \
   CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/sn_a5x.breadcrumb.default.yaml" \
   NAME="test_single_day" \
   ./single.sh
   ```

5. **Check output:**
   - Verify hours show 6-20 only
   - Confirm 3 priority lines (not 8)
   - Ensure new sections render correctly

---

## Questions to Consider

Before choosing an option, think about:

1. **Usage pattern:** Do you take lots of notes, or prefer minimal writing?
2. **Tracking:** Do you want to track habits, mood, sleep?
3. **Priority workflow:** Do you prefer priorities at the top or integrated with tasks?
4. **Schedule density:** Do you need half-hour blocks or full-hour is enough?
5. **Aesthetic:** Minimal/spacious vs. information-dense?

**My recommendation:** Start with **Option 2** as it provides the best balance of functionality, usability, and space optimization for A5 paper.
