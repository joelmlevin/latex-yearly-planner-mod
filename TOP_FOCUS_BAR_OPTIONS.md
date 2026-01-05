# Single Day Planner - Top Focus Bar Design

## New Design Direction

**Key Changes:**
- **Focus bar at top** — Full-width, just under date/navigation links
- **3-column layout** — Equal width columns for "Big Three" priorities
- **3 lines per column** — Space to write each priority
- **Tasks: 6 items** — In right column below
- **Hours: 6-20** — Unchanged
- **No bottom reflection** — Clean, simple layout

---

## Option 1: Three-Column Focus Bar (Clean Labels)

### Visual Layout
```
┌──────────────────────────────────────────────────────────────┐
│  MONDAY, January 5, 2026     Links: Week | Month | Quarter  │
├──────────────────────────────────────────────────────────────┤
│  Today's Focus                                               │
│  ──────────────────────────────────────────────────────────  │
│  Priority 1          │  Priority 2          │  Priority 3   │
│  ─────────────────── │  ─────────────────── │  ────────────  │
│  ─────────────────── │  ─────────────────── │  ────────────  │
│  ─────────────────── │  ─────────────────── │  ────────────  │
├──────────────┬───────────────────────────────────────────────┤
│              │                                               │
│  Schedule    │  Tasks                                        │
│  ────────    │  ─────                                        │
│   6 ──────   │  □ ────────────────────────────────────────   │
│   7 ──────   │  □ ────────────────────────────────────────   │
│   8 ──────   │  □ ────────────────────────────────────────   │
│   9 ──────   │  □ ────────────────────────────────────────   │
│  10 ──────   │  □ ────────────────────────────────────────   │
│  11 ──────   │  □ ────────────────────────────────────────   │
│  12 ──────   │                                               │
│  13 ──────   │  Notes | More    Reflect    All notes        │
│  14 ──────   │  ────────────────────────────────────────────  │
│  15 ──────   │  ────────────────────────────────────────────  │
│  16 ──────   │  ────────────────────────────────────────────  │
│  17 ──────   │  ────────────────────────────────────────────  │
│  18 ──────   │  ────────────────────────────────────────────  │
│  19 ──────   │  ────────────────────────────────────────────  │
│  20 ──────   │  ────────────────────────────────────────────  │
│              │  ────────────────────────────────────────────  │
│              │  ────────────────────────────────────────────  │
│              │  ────────────────────────────────────────────  │
│              │  ...23 lines total...                         │
└──────────────┴───────────────────────────────────────────────┘
```

### Template Code (_common_05_daily.tpl)
```latex
{{- $today := .Body.Day -}}

%% Full-width focus bar at top (3 equal columns)
\newlength{\myLenFocusCol}
\newlength{\myLenFocusColSep}
\setlength{\myLenFocusColSep}{5pt}
\setlength{\myLenFocusCol}{\dimexpr.333\linewidth-.667\myLenFocusColSep}

\myUnderline{Today's Focus}

\begin{minipage}[t]{\myLenFocusCol}
  {\small Priority 1}
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}%
\hspace{\myLenFocusColSep}%
\begin{minipage}[t]{\myLenFocusCol}
  {\small Priority 2}
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}%
\hspace{\myLenFocusColSep}%
\begin{minipage}[t]{\myLenFocusCol}
  {\small Priority 3}
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}

\vspace{3mm}

%% Two-column section below (schedule + tasks/notes)
\begin{minipage}[t]{\myLenTriCol}
{{template "schedule.tpl" dict "Cfg" .Cfg "Day" .Body.Day}}
  \vspace{\dimexpr4mm+.3pt}

{{- if .Cfg.CalAfterSchedule -}}
{{- template "monthTabularV2.tpl" dict "Month" .Body.Month "Today" $today -}}
{{- end -}}
\end{minipage}%
\hspace{\myLenTriColSep}%
\begin{minipage}[t]{\dimexpr2\myLenTriCol+\myLenTriColSep}
  \myUnderline{Tasks}
  \Repeat{6}{\myTodoLineGray}

  \vskip\dimexpr5.4mm

  \myUnderline{Notes $\vert$ {{ $today.LinkLeaf "More" "More" }}\hfill{}{{ $today.LinkLeaf "Reflect" "Reflect" }}\hfill{}\hyperlink{Notes Index}{All notes}}
  \myMash[\myDailySpring]{23}{\myNumDotWidthTwoThirds}
\end{minipage}

\par\pagebreak
```

**Features:**
- Explicit "Priority 1/2/3" labels
- Clean, clear structure
- 23 note lines

---

## Option 2: Three-Column Focus Bar (Numbered, No Labels)

### Visual Layout
```
┌──────────────────────────────────────────────────────────────┐
│  MONDAY, January 5, 2026     Links: Week | Month | Quarter  │
├──────────────────────────────────────────────────────────────┤
│  Today's Big Three                                           │
│  ──────────────────────────────────────────────────────────  │
│  1.                  │  2.                  │  3.            │
│  ─────────────────── │  ─────────────────── │  ────────────  │
│  ─────────────────── │  ─────────────────── │  ────────────  │
│  ─────────────────── │  ─────────────────── │  ────────────  │
├──────────────┬───────────────────────────────────────────────┤
│              │                                               │
│  Schedule    │  Tasks                                        │
│  ────────    │  ─────                                        │
│   6 ──────   │  □ ────────────────────────────────────────   │
│   7 ──────   │  □ ────────────────────────────────────────   │
│   8 ──────   │  □ ────────────────────────────────────────   │
│   9 ──────   │  □ ────────────────────────────────────────   │
│  10 ──────   │  □ ────────────────────────────────────────   │
│  11 ──────   │  □ ────────────────────────────────────────   │
│  12 ──────   │                                               │
│  13 ──────   │  Notes | More    Reflect    All notes        │
│  14 ──────   │  ────────────────────────────────────────────  │
│  15 ──────   │  ────────────────────────────────────────────  │
│  16 ──────   │  ────────────────────────────────────────────  │
│  17 ──────   │  ────────────────────────────────────────────  │
│  18 ──────   │  ────────────────────────────────────────────  │
│  19 ──────   │  ────────────────────────────────────────────  │
│  20 ──────   │  ────────────────────────────────────────────  │
│              │  ────────────────────────────────────────────  │
│              │  ────────────────────────────────────────────  │
│              │  ...23 lines total...                         │
└──────────────┴───────────────────────────────────────────────┘
```

### Template Code (_common_05_daily.tpl)
```latex
{{- $today := .Body.Day -}}

%% Full-width focus bar at top (3 equal columns)
\newlength{\myLenFocusCol}
\newlength{\myLenFocusColSep}
\setlength{\myLenFocusColSep}{5pt}
\setlength{\myLenFocusCol}{\dimexpr.333\linewidth-.667\myLenFocusColSep}

\myUnderline{Today's Big Three}

\begin{minipage}[t]{\myLenFocusCol}
  1.
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}%
\hspace{\myLenFocusColSep}%
\begin{minipage}[t]{\myLenFocusCol}
  2.
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}%
\hspace{\myLenFocusColSep}%
\begin{minipage}[t]{\myLenFocusCol}
  3.
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}

\vspace{3mm}

%% Two-column section below (schedule + tasks/notes)
\begin{minipage}[t]{\myLenTriCol}
{{template "schedule.tpl" dict "Cfg" .Cfg "Day" .Body.Day}}
  \vspace{\dimexpr4mm+.3pt}

{{- if .Cfg.CalAfterSchedule -}}
{{- template "monthTabularV2.tpl" dict "Month" .Body.Month "Today" $today -}}
{{- end -}}
\end{minipage}%
\hspace{\myLenTriColSep}%
\begin{minipage}[t]{\dimexpr2\myLenTriCol+\myLenTriColSep}
  \myUnderline{Tasks}
  \Repeat{6}{\myTodoLineGray}

  \vskip\dimexpr5.4mm

  \myUnderline{Notes $\vert$ {{ $today.LinkLeaf "More" "More" }}\hfill{}{{ $today.LinkLeaf "Reflect" "Reflect" }}\hfill{}\hyperlink{Notes Index}{All notes}}
  \myMash[\myDailySpring]{23}{\myNumDotWidthTwoThirds}
\end{minipage}

\par\pagebreak
```

**Features:**
- Simple numbered columns (1, 2, 3)
- Cleaner look, less text
- Called "Today's Big Three"
- 23 note lines

---

## Option 3: Three-Column Focus Bar (No Labels, Pure Lines)

### Visual Layout
```
┌──────────────────────────────────────────────────────────────┐
│  MONDAY, January 5, 2026     Links: Week | Month | Quarter  │
├──────────────────────────────────────────────────────────────┤
│  Focus                                                       │
│  ──────────────────────────────────────────────────────────  │
│  ────────────────────│────────────────────│─────────────────  │
│  ────────────────────│────────────────────│─────────────────  │
│  ────────────────────│────────────────────│─────────────────  │
├──────────────┬───────────────────────────────────────────────┤
│              │                                               │
│  Schedule    │  Additional Tasks                             │
│  ────────    │  ─────────────────                            │
│   6 ──────   │  □ ────────────────────────────────────────   │
│   7 ──────   │  □ ────────────────────────────────────────   │
│   8 ──────   │  □ ────────────────────────────────────────   │
│   9 ──────   │  □ ────────────────────────────────────────   │
│  10 ──────   │  □ ────────────────────────────────────────   │
│  11 ──────   │  □ ────────────────────────────────────────   │
│  12 ──────   │                                               │
│  13 ──────   │  Notes | More    Reflect    All notes        │
│  14 ──────   │  ────────────────────────────────────────────  │
│  15 ──────   │  ────────────────────────────────────────────  │
│  16 ──────   │  ────────────────────────────────────────────  │
│  17 ──────   │  ────────────────────────────────────────────  │
│  18 ──────   │  ────────────────────────────────────────────  │
│  19 ──────   │  ────────────────────────────────────────────  │
│  20 ──────   │  ────────────────────────────────────────────  │
│              │  ────────────────────────────────────────────  │
│              │  ────────────────────────────────────────────  │
│              │  ...23 lines total...                         │
└──────────────┴───────────────────────────────────────────────┘
```

### Template Code (_common_05_daily.tpl)
```latex
{{- $today := .Body.Day -}}

%% Full-width focus bar at top (3 equal columns, no labels)
\newlength{\myLenFocusCol}
\newlength{\myLenFocusColSep}
\setlength{\myLenFocusColSep}{5pt}
\setlength{\myLenFocusCol}{\dimexpr.333\linewidth-.667\myLenFocusColSep}

\myUnderline{Focus}

\begin{minipage}[t]{\myLenFocusCol}
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}%
\hspace{\myLenFocusColSep}%
\begin{minipage}[t]{\myLenFocusCol}
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}%
\hspace{\myLenFocusColSep}%
\begin{minipage}[t]{\myLenFocusCol}
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}

\vspace{3mm}

%% Two-column section below (schedule + tasks/notes)
\begin{minipage}[t]{\myLenTriCol}
{{template "schedule.tpl" dict "Cfg" .Cfg "Day" .Body.Day}}
  \vspace{\dimexpr4mm+.3pt}

{{- if .Cfg.CalAfterSchedule -}}
{{- template "monthTabularV2.tpl" dict "Month" .Body.Month "Today" $today -}}
{{- end -}}
\end{minipage}%
\hspace{\myLenTriColSep}%
\begin{minipage}[t]{\dimexpr2\myLenTriCol+\myLenTriColSep}
  \myUnderline{Additional Tasks}
  \Repeat{6}{\myTodoLineGray}

  \vskip\dimexpr5.4mm

  \myUnderline{Notes $\vert$ {{ $today.LinkLeaf "More" "More" }}\hfill{}{{ $today.LinkLeaf "Reflect" "Reflect" }}\hfill{}\hyperlink{Notes Index}{All notes}}
  \myMash[\myDailySpring]{23}{\myNumDotWidthTwoThirds}
\end{minipage}

\par\pagebreak
```

**Features:**
- Minimalist — just "Focus" header
- No labels/numbers, pure blank lines
- Emphasizes that focus items are different from tasks
- Tasks called "Additional Tasks"
- 23 note lines

---

## Option 4: Four-Column Focus Bar (More Granular)

### Visual Layout
```
┌──────────────────────────────────────────────────────────────┐
│  MONDAY, January 5, 2026     Links: Week | Month | Quarter  │
├──────────────────────────────────────────────────────────────┤
│  Top Priorities                                              │
│  ──────────────────────────────────────────────────────────  │
│  1.          │ 2.           │ 3.           │ 4.             │
│  ──────────  │ ───────────  │ ───────────  │ ──────────     │
│  ──────────  │ ───────────  │ ───────────  │ ──────────     │
│  ──────────  │ ───────────  │ ───────────  │ ──────────     │
├──────────────┬───────────────────────────────────────────────┤
│              │                                               │
│  Schedule    │  Tasks                                        │
│  ────────    │  ─────                                        │
│   6 ──────   │  □ ────────────────────────────────────────   │
│   7 ──────   │  □ ────────────────────────────────────────   │
│   8 ──────   │  □ ────────────────────────────────────────   │
│   9 ──────   │  □ ────────────────────────────────────────   │
│  10 ──────   │  □ ────────────────────────────────────────   │
│  11 ──────   │  □ ────────────────────────────────────────   │
│  12 ──────   │                                               │
│  13 ──────   │  Notes | More    Reflect    All notes        │
│  14 ──────   │  ────────────────────────────────────────────  │
│  15 ──────   │  ────────────────────────────────────────────  │
│  16 ──────   │  ────────────────────────────────────────────  │
│  17 ──────   │  ────────────────────────────────────────────  │
│  18 ──────   │  ────────────────────────────────────────────  │
│  19 ──────   │  ────────────────────────────────────────────  │
│  20 ──────   │  ────────────────────────────────────────────  │
│              │  ────────────────────────────────────────────  │
│              │  ────────────────────────────────────────────  │
│              │  ...23 lines total...                         │
└──────────────┴───────────────────────────────────────────────┘
```

### Template Code (_common_05_daily.tpl)
```latex
{{- $today := .Body.Day -}}

%% Full-width focus bar at top (4 equal columns)
\newlength{\myLenFocusColFour}
\newlength{\myLenFocusColFourSep}
\setlength{\myLenFocusColFourSep}{4pt}
\setlength{\myLenFocusColFour}{\dimexpr.25\linewidth-.75\myLenFocusColFourSep}

\myUnderline{Top Priorities}

\begin{minipage}[t]{\myLenFocusColFour}
  {\small 1.}
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}%
\hspace{\myLenFocusColFourSep}%
\begin{minipage}[t]{\myLenFocusColFour}
  {\small 2.}
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}%
\hspace{\myLenFocusColFourSep}%
\begin{minipage}[t]{\myLenFocusColFour}
  {\small 3.}
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}%
\hspace{\myLenFocusColFourSep}%
\begin{minipage}[t]{\myLenFocusColFour}
  {\small 4.}
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}

\vspace{3mm}

%% Two-column section below (schedule + tasks/notes)
\begin{minipage}[t]{\myLenTriCol}
{{template "schedule.tpl" dict "Cfg" .Cfg "Day" .Body.Day}}
  \vspace{\dimexpr4mm+.3pt}

{{- if .Cfg.CalAfterSchedule -}}
{{- template "monthTabularV2.tpl" dict "Month" .Body.Month "Today" $today -}}
{{- end -}}
\end{minipage}%
\hspace{\myLenTriColSep}%
\begin{minipage}[t]{\dimexpr2\myLenTriCol+\myLenTriColSep}
  \myUnderline{Tasks}
  \Repeat{6}{\myTodoLineGray}

  \vskip\dimexpr5.4mm

  \myUnderline{Notes $\vert$ {{ $today.LinkLeaf "More" "More" }}\hfill{}{{ $today.LinkLeaf "Reflect" "Reflect" }}\hfill{}\hyperlink{Notes Index}{All notes}}
  \myMash[\myDailySpring]{23}{\myNumDotWidthTwoThirds}
\end{minipage}

\par\pagebreak
```

**Features:**
- **4 columns** instead of 3 (more priorities tracked)
- Numbered 1-4
- Narrower columns (may be tight on A5)
- 23 note lines

**Note:** This might be tight on A5 paper, but provides more top-level focus items.

---

## Feature Comparison

| Feature | Option 1 | Option 2 | Option 3 | Option 4 |
|---------|----------|----------|----------|----------|
| **Focus columns** | 3 | 3 | 3 | 4 |
| **Focus labels** | "Priority 1/2/3" | "1. 2. 3." | None | "1. 2. 3. 4." |
| **Header text** | "Today's Focus" | "Today's Big Three" | "Focus" | "Top Priorities" |
| **Lines per column** | 3 | 3 | 3 | 3 |
| **Task section name** | "Tasks" | "Tasks" | "Additional Tasks" | "Tasks" |
| **Task items** | 6 | 6 | 6 | 6 |
| **Note lines** | 23 | 23 | 23 | 23 |
| **Best for A5** | ✅ Yes | ✅ Yes | ✅ Yes | ⚠️ Tight |

---

## My Recommendation

### 🏆 **Option 2: "Today's Big Three" with Numbers**

**Why:**
1. **Clear but minimal** — Simple "1. 2. 3." is clean and unobtrusive
2. **Reinforces the concept** — "Big Three" messaging
3. **Easy to scan** — Numbers provide visual order without being wordy
4. **A5 optimized** — 3 columns fit well on smaller paper
5. **Implicit ordering** — Numbers suggest priority without being prescriptive

**Second choice:** Option 3 if you want the absolute minimalist approach (no labels at all).

**Avoid:** Option 4 unless you really need 4 priorities — it may be cramped on A5.

---

## Configuration Changes Required

```yaml
# cfg/base.yaml
layout:
  numbers:
    dailybottomhour: 6     # Changed from 7
    dailytophour: 20       # Changed from 23
```

**Note:** We don't need `dailytodos: 3` anymore since the focus items are now in a separate bar, not using the `\myNumDailyTodos` macro.

---

Which option would you like to proceed with?
