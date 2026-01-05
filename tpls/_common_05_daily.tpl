{{- $today := .Body.Day -}}

%% Full-width focus bar at top (3 equal columns with vertical separators, no lines)
{\parskip=0pt\interlinepenalty=10000
\myUnderline{Focus}
\nobreak
\begin{minipage}[t]{\myLenTriCol}
  \rule{0pt}{4\myLenLineHeightButLine}%
\end{minipage}%
{\color{lightgray}\vrule width 0.4pt height 4\myLenLineHeightButLine}%
\begin{minipage}[t]{\myLenTriCol}
  \rule{0pt}{4\myLenLineHeightButLine}%
\end{minipage}%
{\color{lightgray}\vrule width 0.4pt height 4\myLenLineHeightButLine}%
\begin{minipage}[t]{\myLenTriCol}
  \rule{0pt}{4\myLenLineHeightButLine}%
\end{minipage}
\par}
\nobreak\vspace*{2mm}\nobreak

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
