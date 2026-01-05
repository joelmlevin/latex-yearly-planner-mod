{{- $today := .Body.Day -}}

%% Full-width focus bar at top (3 equal columns, no labels)
\myUnderline{Focus}

\begin{minipage}[t]{\myLenTriCol}
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}%
\hspace{\myLenTriColSep}%
\begin{minipage}[t]{\myLenTriCol}
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
  \vskip\myLenLineHeightButLine\myLineGray
\end{minipage}%
\hspace{\myLenTriColSep}%
\begin{minipage}[t]{\myLenTriCol}
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
  \myMash[\myDailySpring]{\myNumDailyNotes}{\myNumDotWidthTwoThirds}
\end{minipage}
\par\pagebreak
