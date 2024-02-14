\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{alittlebear}[2024/02/01 alittlebear]

%settings
\def\filename{\headername \headernum} %name of file
\setlength\parindent{0pt} %paragraph indent
\def\maincolor{brown} %main color for footer header and hyperlinks



%Header and footer
\RequirePackage{xcolor, fancyhdr, lastpage, fourier-orns, pgfornament}
\def\headerfootercolor{\color{\maincolor!80!black}} %header & footer color
%header line
\renewcommand{\headrule}{
    \headerfootercolor\hrulefill
    \raisebox{-2.1pt}{\footnotesize\quad\floweroneleft\quad \filename\quad\floweroneright\quad}\hrulefill}%{\color{brown}\begin{center}\pgfornament[width=7cm]{88}\end{center}}
%footer line
\renewcommand{\footrule}{
    \headerfootercolor\hrulefill
    \raisebox{-2.1pt}{\quad\decofourleft\leafSE\quad\footnotesize Page \thepage\ of \pageref{LastPage}\quad\leafSW\decofourright\quad}\hrulefill}
%first page style
\fancypagestyle{firstpagestyle}{
    \fancyhf{}
    \chead{\headerfootercolor\course}
    \lhead{\headerfootercolor\today}
    \rhead{\headerfootercolor\name}
    \setlength{\headheight}{20pt}}
%later page style
\fancypagestyle{style}{
    \fancyhf{}
    \lhead{\headerfootercolor\course}
    \rhead{\headerfootercolor\name}
    %\chead{\today}
    \setlength{\headheight}{20pt}}
%declare first page style
\AtBeginDocument{\thispagestyle{firstpagestyle}}




%indent and format
\newcommand{\ind}[1][5]{\hspace*{#1mm}}
\newcommand{\unind}[1][5]{\hspace*{-#1mm}}
\newcommand{\explain}[2][20]{\\\ind[#1] {#2}}
\newcommand{\tbf}[1]{\textbf{#1}}


%Define options of DocumentClass
\def\alb@ptsize{12pt} % https://tex.stackexchange.com/a/634138/215221
\DeclareOption{10pt}{\def\alb@ptsize{10pt}}
\DeclareOption{11pt}{\def\alb@ptsize{11pt}}
\DeclareOption{12pt}{\def\alb@ptsize{12pt}}
\def\alb@side{oneside}
\DeclareOption{oneside}{\def\alb@side{oneside}}
\DeclareOption{twoside}{\def\alb@side{twoside}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsart}}
\ProcessOptions\relax
\LoadClass[\alb@ptsize, \alb@side]{amsart}



%Required Packages and settings
\RequirePackage[margin=0.5in]{geometry} %Default margin is 0.5inch / 1inch
\RequirePackage{lmodern, enumitem, needspace} % dynamic line breaking
\RequirePackage{hyperref} % for pdf bookmarks, other information and org-mode
\hypersetup {pdfstartview=FitH, colorlinks=true, linkcolor=\maincolor}
\RequirePackage{ifthen}
\RequirePackage{amsmath, amssymb, amsthm, amscd, graphicx}
%multlined environment inside align
\RequirePackage{mathtools}



\RequirePackage{breqn}

\RequirePackage{changepage} % for adjustwidth environment
\newcommand{\indenv}[2][1]{
    \begin{adjustwidth}{#1cm}{}
        #2
    \end{adjustwidth}
}

\newcommand{\np}{\newpage}
\newcommand{\ds}{\displaystyle}

\RequirePackage{mathrsfs}
\DeclareMathOperator{\vspan}{span}
\DeclareMathOperator{\rank}{rank}
\DeclareMathOperator{\im}{im}


%number line in * environment, add \lebel{} and refer as \eqref{}
\newcommand\numberthis{\addtocounter{equation}{1}\tag{\theequation}}
% change text spacing, margin etc
\RequirePackage{microtype}
% \lstinputlisting[language=Python, firstline=37, lastline=45]{source_filename.py}
\RequirePackage{listings}
%color boxes
\RequirePackage[breakable, skins, theorems]{tcolorbox}
%use \tcblower for break
%use {Title}{Ref} lemma:Ref for reference, e.g. nameref, pageref, ref
\theoremstyle{definition}
\newcommand{\qbreak}{\tcblower}
\newcommand{\envbreak}{%
  \begin{tikzpicture}
  \path[use as bounding box] (0,0) -- (\linewidth,0);
  \draw[color=\maincolor!75!black,dashed,dash phase=2pt]
        (0-\kvtcb@leftlower-\kvtcb@boxsep,0)--
        (\linewidth+\kvtcb@rightlower+\kvtcb@boxsep,0);
  \end{tikzpicture}%
}
\newcommand{\retcbcnt}[1]{\setcounter{tcb@cnt@#1}{0}}
\newcommand{\tcbcnt}[2]{\setcounter{tcb@cnt@#1}{#2}}
\newtcolorbox{note}{
    notitle,
    enforce breakable, left=5mm,
    opacityback=0.3, opacityframe=0.3,
    before skip=10pt, after skip=10pt,
    colback=gray!3!white, colframe=gray!30!white
}
\RequirePackage{wasysym} %\smiley
\newtcolorbox{mathnote}{
    notitle,
    opacityback=0.8, opacityframe=0.8,
    before skip=10pt, after skip=10pt,
    enforce breakable, left=5mm,
    colback=yellow!3!white, colframe=orange!20!white,
    after upper={\hfill$\smiley$}
}
\newtcolorbox{tbox}[2][]{
    colbacktitle=orange!10!white,
colback=orange!10!white,coltitle=orange!70!black,
title={\centering#2},fonttitle=\bfseries,#1
}
\newtheorem*{hint}{Hint}
\tcolorboxenvironment{hint}{
    enforce breakable, enhanced,
    opacityback=0.8, opacityframe=0.8,
    before skip=10pt, after skip=10pt,
    colback=yellow!30!white, colframe=yellow!30!white,
    after upper={\hfill$\heartsuit$}
}{}
\newtheorem{remark}{Remark}
\tcolorboxenvironment{remark}{
    enforce breakable, enhanced,    
    opacityback=0.8, opacityframe=0.8,
    before skip=10pt, after skip=10pt,
    colback=orange!15!white, colframe=orange!15!white,
    after upper={\hfill$\triangle$}
}{}
\tcolorboxenvironment{proof}{
    enforce breakable, left=5mm,
    opacityback=0.8, opacityframe=0.8,
    before skip=10pt, after skip=10pt,
    colback=yellow!3!white, colframe=orange!20!white
}{}
\newtcbtheorem{question}{Question}{
    enforce breakable, enhanced, 
    opacityback=0.8, opacityframe=0.8,
    colframe=blue!30!white, colback=blue!3!white,
    colbacktitle=blue!10!white, coltitle=red!30!black, 
    arc=1mm, fonttitle=\bfseries,
    separator sign dash,
    after upper={\hfill$\textit{?}\,$}
}{question}
\newtcbtheorem{claim}{Claim}{
    enforce breakable, enhanced, 
    opacityback=0.8, opacityframe=0.8,
    attach boxed title to top left = {yshift=-0.50mm, xshift=0mm},
    colframe=pink!40!white, colback=pink!30!white,
    colbacktitle=pink!40!white, coltitle=pink!30!black, 
    arc=1mm, fonttitle=\bfseries,
    separator sign dash,
    after upper={\hfill$\lozenge$}
}{claim}
\newtcbtheorem{definition}{Definition}{
    enforce breakable, enhanced, 
    opacityback=0.8, opacityframe=0.8,
    attach boxed title to top text left = {yshift=-2.50mm},
    colframe=olive!50!white, colback=olive!5!white,
    colbacktitle=olive!10!white, coltitle=olive!30!black, 
    arc=1mm, fonttitle=\bfseries,
    separator sign dash
}{definition}
\newtcbtheorem{corollary}{Corollary}{
    enforce breakable, enhanced, 
    opacityback=0.8, opacityframe=0.8,
    attach boxed title to top text left = {yshift=-2.50mm},
    colframe=green!50!white, colback=green!2!white,
    colbacktitle=green!10!white, coltitle=green!30!black, 
    arc=1mm, fonttitle=\bfseries,
    separator sign dash
}{corollary}
\newtcbtheorem{theorem}{Theorem}{
    enforce breakable, enhanced, 
    opacityback=0.8, opacityframe=0.8,
    attach boxed title to top text left = {yshift=-2.50mm},
    colframe=cyan!50!white, colback=cyan!2!white,
    colbacktitle=cyan!10!white, coltitle=cyan!30!black, 
    arc=1mm, fonttitle=\bfseries,
    separator sign dash
}{theorem}
\newtcbtheorem{lemma}{Lemma}{
    enforce breakable, enhanced, 
    opacityback=0.8, opacityframe=0.8,
    attach boxed title to top text left = {yshift=-2.50mm},
    colframe=teal!40!white, colback=teal!4!white,
    colbacktitle=teal!10!white, coltitle=teal!40!black, 
    arc=1mm, fonttitle=\bfseries,
    separator sign dash
}{lemma}
\RequirePackage{varwidth}
\newtcbtheorem{exercise}{Exercise}{
    enforce breakable, enhanced, 
    before skip=2mm, after skip=2mm,
    colback=black!5, colframe=black!50, boxrule=0.2mm,
    attach boxed title to top={},
    varwidth boxed title*=-3cm,
    boxed title style={frame code={
        \path[fill=tcbcolback!30!black]
        ([yshift=-1mm,xshift=-1mm]frame.north west)
        arc[start angle=0,end angle=180,radius=1mm]
        ([yshift=-1mm,xshift=1mm]frame.north east)
        arc[start angle=180,end angle=0,radius=1mm];
        \path[left color=tcbcolback!60!black,right color=tcbcolback!60!black,
        middle color=tcbcolback!80!black]
        ([xshift=-2mm]frame.north west) -- ([xshift=2mm]frame.north east)
        [rounded corners=1mm]-- ([xshift=1mm,yshift=-1mm]frame.north east)
        -- (frame.south east) -- (frame.south west)
        -- ([xshift=-1mm,yshift=-1mm]frame.north west)
        [sharp corners]-- cycle;
    },interior engine=empty,
    },
    fonttitle=\bfseries,
    after = {\tcbcnt{question}{0}}
}{exercise}
\newtcbtheorem{unit}{Unit}{
    enforce breakable, enhanced, 
    before skip=2mm, after skip=2mm,
    colback=black!5, colframe=black!50, boxrule=0.2mm,
    attach boxed title to top={},
    varwidth boxed title*=-3cm,
    boxed title style={frame code={
        \path[fill=tcbcolback!30!black]
        ([yshift=-1mm,xshift=-1mm]frame.north west)
        arc[start angle=0,end angle=180,radius=1mm]
        ([yshift=-1mm,xshift=1mm]frame.north east)
        arc[start angle=180,end angle=0,radius=1mm];
        \path[left color=tcbcolback!60!black,right color=tcbcolback!60!black,
        middle color=tcbcolback!80!black]
        ([xshift=-2mm]frame.north west) -- ([xshift=2mm]frame.north east)
        [rounded corners=1mm]-- ([xshift=1mm,yshift=-1mm]frame.north east)
        -- (frame.south east) -- (frame.south west)
        -- ([xshift=-1mm,yshift=-1mm]frame.north west)
        [sharp corners]-- cycle;
    },interior engine=empty,
    },
    fonttitle=\bfseries,
}{unit}
\newtcbtheorem{chapter}{Chapter}{
    enforce breakable, enhanced, 
    before skip=2mm, after skip=2mm,
    colback=black!5, colframe=black!50, boxrule=0.2mm,
    attach boxed title to top={},
    varwidth boxed title*=-3cm,
    boxed title style={frame code={
        \path[fill=tcbcolback!30!black]
        ([yshift=-1mm,xshift=-1mm]frame.north west)
        arc[start angle=0,end angle=180,radius=1mm]
        ([yshift=-1mm,xshift=1mm]frame.north east)
        arc[start angle=180,end angle=0,radius=1mm];
        \path[left color=tcbcolback!60!black,right color=tcbcolback!60!black,
        middle color=tcbcolback!80!black]
        ([xshift=-2mm]frame.north west) -- ([xshift=2mm]frame.north east)
        [rounded corners=1mm]-- ([xshift=1mm,yshift=-1mm]frame.north east)
        -- (frame.south east) -- (frame.south west)
        -- ([xshift=-1mm,yshift=-1mm]frame.north west)
        [sharp corners]-- cycle;
    },interior engine=empty,
    },
    fonttitle=\bfseries,
}{chapter}


\newcommand{\newq}[3][]{\begin{question}{#1}{#2}#3\end{question}}
\newcommand{\newe}[3][]{\begin{exercise}{#1}{#2}#3\end{exercise}}
\newcommand{\newu}[3][]{\begin{unit}{#1}{#2}#3\end{unit}}
\newcommand{\newch}[3][]{\begin{chapter}{#1}{#2}#3\end{chapter}}
\newcommand{\newd}[3][]{\begin{definition}{#1}{#2}#3\end{definition}}
\newcommand{\newl}[3][]{\begin{lemma}{#1}{#2}#3\end{lemma}}
\newcommand{\newcl}[3][]{\begin{claim}{#1}{#2}#3\end{claim}}
\newcommand{\newco}[3][]{\begin{corollary}{#1}{#2}#3\end{corollary}}
\newcommand{\newt}[3][]{\begin{theorem}{#1}{#2}#3\end{theorem}}

\newcommand{\newr}[1]{\begin{remark}#1\end{remark}}
\newcommand{\newn}[1]{\begin{note}#1\end{note}}
\newcommand{\newm}[1]{\begin{mathnote}#1\end{mathnote}}
\newcommand{\newh}[1]{\begin{hint}#1\end{hint}}
\newcommand{\newp}[1]{\begin{proof}#1\end{proof}}






% Useful commands
\newcommand{\T}[1]{\text{#1}}
\newcommand{\Al}[3]{#1 &=#2 &\text{#3}&&\\}
\newcommand{\cd}{\cdot}
\newcommand{\alt}[1]{\intertext{#1}}
% new and renewed commands
\DeclareRobustCommand{\bb}[1]{\mathbb{#1}}
\DeclareRobustCommand{\cal}[1]{\mathcal{#1}}
\DeclareRobustCommand{\sc}[1]{\textsc{#1}}

\newcommand\D{\mathop{}\!\mathrm{d}}
% Derivartive in Leibniz notation d{#1}/d{#2}
\newcommand{\DD}[2]{ \frac{\D #1 }{\D #2 } }

\renewcommand{\qedsymbol}{$_{\scriptstyle \substack{\sc{quod}\\\sc{erat}\\\sc{dem}\scalebox{0.53}{$\blacksquare$}}}$}
% beamer does not define a \labelenumi therefore this can't be renewed.
\def\labelenumi{\theenumi)} % to make (n) into n)
% Symbols
% \newcommand*{\eg}{\leavevmode\unskip , e. g., \ignorespaces} % for example
% \newcommand*{\ie}{\leavevmode\unskip, i. e., \ignorespaces} % that is
\newcommand{\nil}{\varnothing}
\renewcommand{\O}{\cal{O}} % Reals
\newcommand{\C}{\bb{C}} % Rationals
\newcommand{\R}{\bb{R}} % Reals
\newcommand{\Q}{\bb{Q}} % Rationals
\newcommand{\Z}{\bb{Z}} % Integers
\newcommand{\N}{\bb{N}} % Naturals
\renewcommand{\P}{\bb{P}} % Primes
\newcommand{\Pset}[1]{\mathcal{P}(#1)} %power set
\newcommand{\Relate}[2]{#1\mathcal{R}#2} %relation
\newcommand{\relate}{\mathcal{R}}
\newcommand{\F}{\bb{F}} 
\newcommand{\GF}[1][2]{\bb{F}_{#1}} 
\newcommand{\modulo}[1][n]{\Z/#1\Z} 
\newcommand{\ra}{\rightarrow}
\newcommand{\Ra}{\Rightarrow}
\newcommand{\?}{\stackrel{?}{=}}
\newcommand{\is}{\equiv}
\newcommand{\al}{\alpha}
\newcommand{\ep}{\varepsilon}
%\renewcommand{\phi}{\varphi}
\newcommand{\p}{\partial}
\newcommand{\injective}{\hookrightarrow}
\newcommand{\surjective}{\twoheadrightarrow}
\newcommand{\bijective}{\hookrightarrow\mathrel{\mspace{-15mu}}\rightarrow}
\newcommand{\ceil}[1]{\left\lceil#1\right\rceil}
\newcommand{\floor}[1]{\left\lfloor#1\right\rfloor}
\newcommand{\near}[1]{\left\lfloor#1\right\rceil}
\newcommand{\arr}[1]{\left\langle#1\right\rangle}
\newcommand{\bra}[1]{\left(#1\right)} %pair / ()
\newcommand{\sqrbra}[1]{\left[#1\right]} %[]
\newcommand{\abs}[1]{\left|#1\right|}
\newcommand{\curbra}[1]{\left\{#1\right\}} %set {}
\newcommand{\func}[3]{#1: #2 \rightarrow #3}
\newcommand{\norm}[1]{\left|\left|#1\right|\right|}
\DeclareMathOperator{\sgn}{sgn}



%Title
\AtBeginDocument{\hypersetup {pdftitle={\@title}, pdfauthor={\@author}, pdfsubject={\@class}}}
\gdef\@author{\empty}
\gdef\@class{\empty}
\newcommand{\class}[1]{\gdef\@class{#1}}
\renewcommand{\author}[1]{\gdef\@author{#1}}
\renewcommand{\maketitle} {%
  \noindent\ifthenelse{\equal{\@author}{\empty}}{}{\@author\par}%
  \noindent\ifthenelse{\equal{\@class}{\empty}}{}{\@class\par}%
  \noindent\@date\par
  \noindent\textbf{\@title}%
}



% listings
\RequirePackage{listings, xcolor}
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{codeyellow}{rgb}{0.51, 0.37, 0.012}
\lstset {
  aboveskip=\baselineskip,
  commentstyle=\color{codegreen},
  keywordstyle=\bfseries\color{codeyellow},
  numberstyle=\ttfamily\tiny\color{codegray},
  stringstyle=\color{codepurple},
  basicstyle=\ttfamily\footnotesize,
  breakatwhitespace=false,
  breaklines=true,
  captionpos=b,
  keepspaces=true,
  numbers=left,
  xleftmargin=2em,
  numbersep=5pt,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  tabsize=2,
  frame=tb
}
\lstnewenvironment{Cl}
  {\lstset{language=C}}
  {}
\lstnewenvironment{CPP}{\lstset{language=C++}}{}



%Graphs and Questions
% \RequirePackage{graphicx} % figures
% \RequirePackage[caption=false]{subfig}
% \RequirePackage{graphicx, pgffor, ifthen} % for loops and if statements
% \RequirePackage[tableposition=below]{caption} % https://tex.stackexchange.com/a/424725/215221
% \newlength{\unitskipamount}
% \setlength{\unitskipamount}{\medskipamount}
% \gdef\@unitname{Question}
% \newcounter{UnitCounter}
% \newcommand{\setunitname}[1]{\gdef\@unitname{#1}}
% \newcommand{\question}[1][\arabic{UnitCounter}]{%
%   \Needspace*{8\baselineskip}%
%   \addvspace{\unitskipamount}%
%   \def\@currentlabel{#1}%
%   \ifthenelse{\equal{#1}{\value{UnitCounter}}}{\stepcounter{UnitCounter}}{}%
%   \setcounter{section}{0}%
%   \renewcommand{\thesection}{#1.\arabic{section}}%
%   \renewcommand{\theHsection}{#1.\the\value{section}}%
%   \addcontentsline{toc}{part}{#1. \@unitname{}}%
%   \noindent\textbf{\@unitname{} #1. }\ignorespaces%
% }
% \newcommand{\fig}[4][0.4]{
%   \begin{figure}[hbtp]
%     \foreach \path in {#2} {
%         \begin{minipage}{#1\textwidth}
%           \centering % don't introduce new lines in \subfloat{...}
%           \subfloat{\includegraphics[width=\linewidth]{\path}}
%         \end{minipage} % minipage for easy centring
%       }
%     \caption{#3}\label{#4}
%   \end{figure}
%   \PackageWarning{hwcmd}{\noexpand\fig is deprecated, use \noexpand\img instead}
% }
% \ExplSyntaxOn
% \NewDocumentCommand\img{d<>O{0.4}mm} {%
%   \begin{figure}[hbtp]%
%     \foreach \path [count=\i] in {#4} {%
%         \ifthenelse{\equal{\i}{1}}{}{\hspace{0.25cm}}%
%         \begin{minipage}{#2\textwidth}%
%           \centering% don't introduce new lines in \subfloat{...}
%           \subfloat{\includegraphics[width=\linewidth]{\path}}%
%         \end{minipage}%
%       }%
%     \caption{#3}\IfValueT{#1}{\label{#1}}%
%   \end{figure}%
% }

\RequirePackage{tikz}
\usetikzlibrary{
    intersections, arrows.meta,
    automata,er,calc,
    backgrounds,
    mindmap,folding,
    patterns,
    decorations.markings,
    fit,snakes,
    shapes,matrix,
    positioning,
    shapes.geometric,
    arrows,through,
    angles, quotes
}



%idk why putting before does not work, anyway
\pagestyle{style}
