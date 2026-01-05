# Single Day Planner - Revised Layout Options

## Design Requirements
- Hours: **6-20** (15 hours, saves ~2cm)
- Top section: **Focus for Today** (3 priorities)
- Middle section: **Additional Tasks** (separate from focus)
- Bottom section: **Full-width Reflections/Debrief** (uses saved vertical space)
- Schedule format: **Unchanged** (standard hour lines, no modifications)
- **No** habit/water/wellness/quick notes features

---

## Option A: Two-Column Top + Full-Width Bottom

### Visual Layout
```
┌─────────────────────────────────────────────────────────────┐
│  MONDAY, January 5, 2026                                    │
├─────────────┬───────────────────────────────────────────────┤
│             │                                               │
│ Schedule    │  Focus for Today                              │
│ ────────    │  ───────────────                              │
│  6 ─────    │  □ ────────────────────────────────────────   │
│  7 ─────    │  □ ────────────────────────────────────────   │
│  8 ─────    │  □ ────────────────────────────────────────   │
│  9 ─────    │                                               │
│ 10 ─────    │  Additional Tasks                             │
│ 11 ─────    │  ─────────────────                            │
│ 12 ─────    │  □ ────────────────────────────────────────   │
│ 13 ─────    │  □ ────────────────────────────────────────   │
│ 14 ─────    │  □ ────────────────────────────────────────   │
│ 15 ─────    │  □ ────────────────────────────────────────   │
│ 16 ─────    │  □ ────────────────────────────────────────   │
│ 17 ─────    │                                               │
│ 18 ─────    │  Notes | More    Reflect    All notes        │
│ 19 ─────    │  ────────────────────────────────────────────  │
│ 20 ─────    │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ...12 lines...                               │
├─────────────┴───────────────────────────────────────────────┤
│  End of Day Reflection                                      │
│  ──────────────────────                                     │
│  What went well:                                            │
│  ──────────────────────────────────────────────────────────  │
│  ──────────────────────────────────────────────────────────  │
│  What could improve:                                        │
│  ──────────────────────────────────────────────────────────  │
│  ──────────────────────────────────────────────────────────  │
│  Tomorrow's priority:                                       │
│  ──────────────────────────────────────────────────────────  │
└─────────────────────────────────────────────────────────────┘
```

### Template Code (_common_05_daily.tpl)
```latex
{{- $today := .Body.Day -}}

%% Two-column section (schedule + focus/tasks/notes)
\begin{minipage}[t]{\myLenTriCol}
{{template "schedule.tpl" dict "Cfg" .Cfg "Day" .Body.Day}}
  \vspace{\dimexpr4mm+.3pt}

{{- if .Cfg.CalAfterSchedule -}}
{{- template "monthTabularV2.tpl" dict "Month" .Body.Month "Today" $today -}}
{{- end -}}
\end{minipage}%
\hspace{\myLenTriColSep}%
\begin{minipage}[t]{\dimexpr2\myLenTriCol+\myLenTriColSep}
  \myUnderline{Focus for Today\myDummyQ}
  \Repeat{\myNumDailyTodos}{\myTodoLineGray}

  \vskip\dimexpr5.4mm

  \myUnderline{Additional Tasks}
  \Repeat{5}{\myTodoLineGray}

  \vskip\dimexpr5.4mm

  \myUnderline{Notes $\vert$ {{ $today.LinkLeaf "More" "More" }}\hfill{}{{ $today.LinkLeaf "Reflect" "Reflect" }}\hfill{}\hyperlink{Notes Index}{All notes}}
  \myMash[\myDailySpring]{12}{\myNumDotWidthTwoThirds}
\end{minipage}

%% Full-width reflection section at bottom
\vskip\dimexpr3mm

\myUnderline{End of Day Reflection}

{\small What went well:}
\vskip\myLenLineHeightButLine\myLineGray
\vskip\myLenLineHeightButLine\myLineGray

\vskip1mm

{\small What could improve:}
\vskip\myLenLineHeightButLine\myLineGray
\vskip\myLenLineHeightButLine\myLineGray

\vskip1mm

{\small Tomorrow's priority:}
\vskip\myLenLineHeightButLine\myLineGray

\par\pagebreak
```

**Pros:**
- Clear separation: planning (top) vs reflection (bottom)
- Full-width reflection = more writing space
- Structured reflection with prompts

**Cons:**
- Fewer note lines (12 vs 25 in current)
- Takes up significant bottom space

---

## Option B: Taller Two-Column + Compact Reflection

### Visual Layout
```
┌─────────────────────────────────────────────────────────────┐
│  MONDAY, January 5, 2026                                    │
├─────────────┬───────────────────────────────────────────────┤
│             │                                               │
│ Schedule    │  Focus for Today                              │
│ ────────    │  ───────────────                              │
│  6 ─────    │  □ ────────────────────────────────────────   │
│  7 ─────    │  □ ────────────────────────────────────────   │
│  8 ─────    │  □ ────────────────────────────────────────   │
│  9 ─────    │                                               │
│ 10 ─────    │  Additional Tasks                             │
│ 11 ─────    │  ─────────────────                            │
│ 12 ─────    │  □ ────────────────────────────────────────   │
│ 13 ─────    │  □ ────────────────────────────────────────   │
│ 14 ─────    │  □ ────────────────────────────────────────   │
│ 15 ─────    │  □ ────────────────────────────────────────   │
│ 16 ─────    │  □ ────────────────────────────────────────   │
│ 17 ─────    │                                               │
│ 18 ─────    │  Notes | More    Reflect    All notes        │
│ 19 ─────    │  ────────────────────────────────────────────  │
│ 20 ─────    │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ...18 lines...                               │
├─────────────┴───────────────────────────────────────────────┤
│  Daily Reflection                                           │
│  ─────────────────                                          │
│  ──────────────────────────────────────────────────────────  │
│  ──────────────────────────────────────────────────────────  │
│  ──────────────────────────────────────────────────────────  │
└─────────────────────────────────────────────────────────────┘
```

### Template Code (_common_05_daily.tpl)
```latex
{{- $today := .Body.Day -}}

%% Two-column section (schedule + focus/tasks/notes)
\begin{minipage}[t]{\myLenTriCol}
{{template "schedule.tpl" dict "Cfg" .Cfg "Day" .Body.Day}}
  \vspace{\dimexpr4mm+.3pt}

{{- if .Cfg.CalAfterSchedule -}}
{{- template "monthTabularV2.tpl" dict "Month" .Body.Month "Today" $today -}}
{{- end -}}
\end{minipage}%
\hspace{\myLenTriColSep}%
\begin{minipage}[t]{\dimexpr2\myLenTriCol+\myLenTriColSep}
  \myUnderline{Focus for Today\myDummyQ}
  \Repeat{\myNumDailyTodos}{\myTodoLineGray}

  \vskip\dimexpr5.4mm

  \myUnderline{Additional Tasks}
  \Repeat{5}{\myTodoLineGray}

  \vskip\dimexpr5.4mm

  \myUnderline{Notes $\vert$ {{ $today.LinkLeaf "More" "More" }}\hfill{}{{ $today.LinkLeaf "Reflect" "Reflect" }}\hfill{}\hyperlink{Notes Index}{All notes}}
  \myMash[\myDailySpring]{18}{\myNumDotWidthTwoThirds}
\end{minipage}

%% Compact full-width reflection at bottom
\vskip\dimexpr3mm

\myUnderline{Daily Reflection}
\Repeat{3}{\vskip\myLenLineHeightButLine\myLineGray}

\par\pagebreak
```

**Pros:**
- More note lines (18 vs 12 in Option A)
- Simpler reflection section (no prompts, just free-form)
- Still gets benefit of full-width writing space

**Cons:**
- Less structured reflection (no prompts)
- May feel like "just more notes"

---

## Option C: Extended Notes + Optional Reflection Space

### Visual Layout
```
┌─────────────────────────────────────────────────────────────┐
│  MONDAY, January 5, 2026                                    │
├─────────────┬───────────────────────────────────────────────┤
│             │                                               │
│ Schedule    │  Focus for Today                              │
│ ────────    │  ───────────────                              │
│  6 ─────    │  □ ────────────────────────────────────────   │
│  7 ─────    │  □ ────────────────────────────────────────   │
│  8 ─────    │  □ ────────────────────────────────────────   │
│  9 ─────    │                                               │
│ 10 ─────    │  Additional Tasks                             │
│ 11 ─────    │  ─────────────────                            │
│ 12 ─────    │  □ ────────────────────────────────────────   │
│ 13 ─────    │  □ ────────────────────────────────────────   │
│ 14 ─────    │  □ ────────────────────────────────────────   │
│ 15 ─────    │  □ ────────────────────────────────────────   │
│ 16 ─────    │  □ ────────────────────────────────────────   │
│ 17 ─────    │                                               │
│ 18 ─────    │  Notes | More    Reflect    All notes        │
│ 19 ─────    │  ────────────────────────────────────────────  │
│ 20 ─────    │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ...20 lines...                               │
├─────────────┴───────────────────────────────────────────────┤
│                                                             │
│  ─────────────────────────────────────────────────────────  │
│  End of Day: ──────────────────────────────────────────────  │
└─────────────────────────────────────────────────────────────┘
```

### Template Code (_common_05_daily.tpl)
```latex
{{- $today := .Body.Day -}}

%% Two-column section (schedule + focus/tasks/notes)
\begin{minipage}[t]{\myLenTriCol}
{{template "schedule.tpl" dict "Cfg" .Cfg "Day" .Body.Day}}
  \vspace{\dimexpr4mm+.3pt}

{{- if .Cfg.CalAfterSchedule -}}
{{- template "monthTabularV2.tpl" dict "Month" .Body.Month "Today" $today -}}
{{- end -}}
\end{minipage}%
\hspace{\myLenTriColSep}%
\begin{minipage}[t]{\dimexpr2\myLenTriCol+\myLenTriColSep}
  \myUnderline{Focus for Today\myDummyQ}
  \Repeat{\myNumDailyTodos}{\myTodoLineGray}

  \vskip\dimexpr5.4mm

  \myUnderline{Additional Tasks}
  \Repeat{5}{\myTodoLineGray}

  \vskip\dimexpr5.4mm

  \myUnderline{Notes $\vert$ {{ $today.LinkLeaf "More" "More" }}\hfill{}{{ $today.LinkLeaf "Reflect" "Reflect" }}\hfill{}\hyperlink{Notes Index}{All notes}}
  \myMash[\myDailySpring]{20}{\myNumDotWidthTwoThirds}
\end{minipage}

%% Minimal full-width reflection space at bottom
\vskip\dimexpr2mm

\myLineGray
{\small End of Day:} \rule{.7\linewidth}{0.4pt}

\par\pagebreak
```

**Pros:**
- Most note lines (20)
- Minimal but present reflection prompt
- Flexible (can ignore reflection if not needed)

**Cons:**
- Very minimal reflection section
- May not feel substantial enough

---

## Option D: Debrief Box (Structured but Compact)

### Visual Layout
```
┌─────────────────────────────────────────────────────────────┐
│  MONDAY, January 5, 2026                                    │
├─────────────┬───────────────────────────────────────────────┤
│             │                                               │
│ Schedule    │  Focus for Today                              │
│ ────────    │  ───────────────                              │
│  6 ─────    │  □ ────────────────────────────────────────   │
│  7 ─────    │  □ ────────────────────────────────────────   │
│  8 ─────    │  □ ────────────────────────────────────────   │
│  9 ─────    │                                               │
│ 10 ─────    │  Additional Tasks                             │
│ 11 ─────    │  ─────────────────                            │
│ 12 ─────    │  □ ────────────────────────────────────────   │
│ 13 ─────    │  □ ────────────────────────────────────────   │
│ 14 ─────    │  □ ────────────────────────────────────────   │
│ 15 ─────    │  □ ────────────────────────────────────────   │
│ 16 ─────    │  □ ────────────────────────────────────────   │
│ 17 ─────    │                                               │
│ 18 ─────    │  Notes | More    Reflect    All notes        │
│ 19 ─────    │  ────────────────────────────────────────────  │
│ 20 ─────    │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ────────────────────────────────────────────  │
│             │  ...15 lines...                               │
├─────────────┴───────────────────────────────────────────────┤
│  Daily Debrief                                              │
│  ──────────────                                             │
│  Wins: ────────────────  │  Improve: ──────────────────     │
│  ────────────────────────│─────────────────────────────     │
│  ────────────────────────│─────────────────────────────     │
│                                                             │
│  Key Takeaway: ─────────────────────────────────────────    │
└─────────────────────────────────────────────────────────────┘
```

### Template Code (_common_05_daily.tpl)
```latex
{{- $today := .Body.Day -}}

%% Two-column section (schedule + focus/tasks/notes)
\begin{minipage}[t]{\myLenTriCol}
{{template "schedule.tpl" dict "Cfg" .Cfg "Day" .Body.Day}}
  \vspace{\dimexpr4mm+.3pt}

{{- if .Cfg.CalAfterSchedule -}}
{{- template "monthTabularV2.tpl" dict "Month" .Body.Month "Today" $today -}}
{{- end -}}
\end{minipage}%
\hspace{\myLenTriColSep}%
\begin{minipage}[t]{\dimexpr2\myLenTriCol+\myLenTriColSep}
  \myUnderline{Focus for Today\myDummyQ}
  \Repeat{\myNumDailyTodos}{\myTodoLineGray}

  \vskip\dimexpr5.4mm

  \myUnderline{Additional Tasks}
  \Repeat{5}{\myTodoLineGray}

  \vskip\dimexpr5.4mm

  \myUnderline{Notes $\vert$ {{ $today.LinkLeaf "More" "More" }}\hfill{}{{ $today.LinkLeaf "Reflect" "Reflect" }}\hfill{}\hyperlink{Notes Index}{All notes}}
  \myMash[\myDailySpring]{15}{\myNumDotWidthTwoThirds}
\end{minipage}

%% Structured debrief section at bottom
\vskip\dimexpr3mm

\myUnderline{Daily Debrief}

\begin{minipage}[t]{\myLenTwoCol}
  {\small Wins:}
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}%
\hspace{\myLenTwoColSep}%
\begin{minipage}[t]{\myLenTwoCol}
  {\small Improve:}
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}

\vskip2mm

{\small Key Takeaway:} \rule{.8\linewidth}{0.4pt}

\par\pagebreak
```

**Pros:**
- Structured but compact
- Side-by-side "Wins" and "Improve" is efficient
- Key takeaway line for daily learning

**Cons:**
- Fewer note lines (15)
- More complex layout

---

## Feature Comparison

| Feature | Option A | Option B | Option C | Option D |
|---------|----------|----------|----------|----------|
| **Schedule** | 6-20 | 6-20 | 6-20 | 6-20 |
| **Focus items** | 3 | 3 | 3 | 3 |
| **Additional tasks** | 5 | 5 | 5 | 5 |
| **Note lines** | 12 | 18 | 20 | 15 |
| **Reflection type** | Structured prompts | Free-form lines | Minimal line | Structured 2-col |
| **Reflection lines** | 5 (prompted) | 3 (free) | 1 (minimal) | 4 (structured) |
| **Best for** | Structured reflection | Balance | Maximum notes | Quick debrief |

---

## My Recommendation

### 🏆 **Option D: Daily Debrief (Structured but Compact)**

**Why:**
1. **Good balance** — 15 note lines is reasonable, still better than 12-13
2. **Efficient structure** — Side-by-side Wins/Improve uses space well
3. **Actionable** — Focus on wins, improvements, and key takeaway
4. **Not overwhelming** — Compact enough that it doesn't dominate the page
5. **A5 optimized** — Works well with smaller paper size

**Second choice:** Option B if you want more notes space (18 lines) and prefer unstructured reflection.

---

## Configuration Required (All Options)

```yaml
# cfg/base.yaml
layout:
  numbers:
    dailytodos: 3          # Changed from 8
    dailybottomhour: 6     # Changed from 7
    dailytophour: 20       # Changed from 23
```

---

Which option appeals to you? Or would you like me to adjust any of these further?
