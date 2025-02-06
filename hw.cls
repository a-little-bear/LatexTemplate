%Template for LatexTemplate/hw.cls
\iffalse

    \documentclass[11pt, cyan, night, 1in, colorful]{LatexTemplate/hw}

    \def\headername{}

    % These are optinal without coverpage
    \def\course{}
    \def\name{}
    \def\email{}
    \def\info{}
    \def\logo{}

    \begin{document}

    \coverpage[\clsfiles/stars]



    \end{document}

\fi


\iffalse 
    git submodule add https://github.com/a-little-bear/LatexTemplate.git
\fi




\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LatexTemplate/hw}[2024/03/27 LatexTemplate/hw]

\def\clsfiles{LatexTemplate/clsfiles}
\newcommand{\useclspackage}[2][]{\usepackage[#1]{\clsfiles/#2}}

%settings
\def\filename{\headername} %name of file
\def\skippar{5pt} %skip between paragraphs
\def\indentpar{0pt} %indent of paragraph
\def\thmstyle{definition} %asmthm theorme style
\def\defaultlanguage{python}

\newcommand{\thmopacity}{0.8} %opacity of theorem box, default: night mode
\newcommand{\nightmodebackground}{\clsfiles/tree} %background of night mode







% Options
\RequirePackage{silence}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}
\SetupKeyvalOptions{family=ALB,prefix=ALB@,setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ALB}{#1}}
\DeclareStringOption[blue]{color}
\DeclareVoidOption{green}{\ekv{color=green}}
\DeclareVoidOption{cyan}{\ekv{color=cyan}}
\DeclareVoidOption{blue}{\ekv{color=blue}}
\DeclareVoidOption{sakura}{\ekv{color=sakura}}
\DeclareVoidOption{black}{\ekv{color=black}}
\DeclareVoidOption{brown}{\ekv{color=brown}}
\DeclareVoidOption{white}{\ekv{color=white}}
\DeclareVoidOption{red}{\ekv{color=red}}
\DeclareVoidOption{orange}{\ekv{color=orange}}
\DeclareVoidOption{purple}{\ekv{color=purple}}
% margin
\DeclareStringOption[0.5in]{marg}
\DeclareVoidOption{1in}{\ekv{marg=1in}}
\DeclareVoidOption{0.5in}{\ekv{marg=0.5in}}
% green / white / yellow
\DeclareStringOption{mode}
\DeclareVoidOption{geye}{\ekv{mode=geye}}
\DeclareVoidOption{hazy}{\ekv{mode=hazy}}
\DeclareVoidOption{sepia}{\ekv{mode=sepia}}
\DeclareVoidOption{night}{\ekv{mode=night}}
% tcb style
\DeclareStringOption{clsthmstyle}
\DeclareVoidOption{formal}{\ekv{clsthmstyle=formal}}
\DeclareVoidOption{colorful}{\ekv{clsthmstyle=colorful}}
% fontsize
\DeclareStringOption[11pt]{fontsize}
\DeclareVoidOption{10pt}{\ekv{fontsize=10pt}}
\DeclareVoidOption{11pt}{\ekv{fontsize=11pt}}
\DeclareVoidOption{12pt}{\ekv{fontsize=12pt}}
\DeclareDefaultOption{
    \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessKeyvalOptions*\relax
\LoadClass[landscape, a4paper]{article}

\ifdefstring{\ALB@marg}{0.5in}{
    \RequirePackage[top=1mm,bottom=1mm,left=1mm,right=1mm]{geometry}
}{\relax}
\ifdefstring{\ALB@marg}{1in}{
    \RequirePackage[top=1mm,bottom=1mm,left=1mm,right=1mm]{geometry}
}{\relax}


\RequirePackage{lmodern, enumitem} % dynamic line breaking
\RequirePackage{ifthen}
\RequirePackage{amsmath, amssymb, amsthm, graphicx}
\RequirePackage{mathtools} % multlined environment inside align
\RequirePackage{microtype} % text spacing margin etc
\RequirePackage{mathrsfs} % for mathscr
\RequirePackage{listings}
\RequirePackage{setspace}
\RequirePackage{multicol}

\RequirePackage{footnote}
\newcommand{\extractfootnote}[1]{
    \BeforeBeginEnvironment{#1}{\savenotes}
    \AfterEndEnvironment{#1}{\spewnotes}
}
\pagenumbering{gobble}
\RequirePackage{silence}
%Disable all warnings issued by latex starting with "You have..."
\WarningFilter{latex}{You have requested package}
\WarningFilter{fancyhdr}{\footskip is too small}
\WarningsOff[everypage]
\WarningFilter{latex}{The lower box part has become overfull}
\hbadness = 100000
\hfuzz = 100pt


\newcommand\mailto[1]{\href{mailto:#1}{\nolinkurl{#1}}}

\newcommand*{\coverpage}[1][\clsfiles/stars]{
    \newgeometry{margin = 0in}
    \begin{titlepage}
        \includegraphics[width=\paperwidth]{#1}
        \vskip-5pt

        \setlength{\fboxsep}{0pt}
        \ifdefstring{\ALB@mode}{night}{
            \colorbox{black}{\makebox[\linewidth][c]{\shortstack[c]{\vspace{0.3in}}}}
        }{
            \colorbox{\ALB@color}{\makebox[\linewidth][c]{\shortstack[c]{\vspace{0.3in}}}}
        }


        % Title
        \color{ecolor}\rule{\linewidth}{0.3mm} \\[0.4cm]
        \ifcsdef{course}{\centering \huge \tbf{ \color{ecolor} \course} \\[0.5cm] }{}
        \ifcsdef{headername}{\centering \huge \bfseries \color{ecolor} \headername \\[0.5cm] }{}
        \color{ecolor}\rule{\linewidth}{0.3mm} \\[1cm]

        \indenv[3]{
            \begin{minipage}{0.4\textwidth}
                \ifcsdef{name}{\large\tbf{Author:} \name \\[0.5cm]}{}
                \ifcsdef{email}{\large\tbf{Email:} \mailto{\email} \\[0.5cm]}{}
                \ifcsdef{date}{\large\tbf{Date:} \today \\[0.5cm]}{}
                \ifcsdef{info}{\large\tbf{Info:} \info \\[0.5cm]}{}
            \end{minipage}
            \begin{minipage}{0.1\textwidth}
                \hfill
            \end{minipage}
            \begin{minipage}{0.5\textwidth}
                \ifcsdef{logo}{\includegraphics[width=\textwidth/2]{\logo}}{\includegraphics[width=\textwidth/2]{\clsfiles/uoft}}
            \end{minipage}
        }
    \end{titlepage}
    \par
    \restoregeometry
    \np
    \pagestyle{style}
}
% declare first page style
% \AtBeginDocument{\thispagestyle{firstpagestyle}}




\lstnewenvironment{code}{
    \lst@AddToHook{OnEmptyLine}{\addtocounter{lstnumber}{-1}}
    \lstset{
        language=\defaultlanguage,
        numberblanklines=false,
    }
}{}
\lstnewenvironment{latexcode}{\lstset{
        language=[LaTeX]Tex,
        numbers=none
    }}{}








\RequirePackage{anyfontsize}
\RequirePackage{graphicx}
\RequirePackage{xpatch}
\RequirePackage{hyperref}
\hypersetup{
    pdfborder={0 0 0},
    colorlinks,
    colorlinks=true, %set true if you want colored links
    linktoc=all,     %set to all if you want both sections and subsections linked
    citecolor=ecolor,
    filecolor=ecolor,
    linkcolor=ecolor, %epubblue,
    urlcolor=ecolor
}
% list/itemize/enumerate setting
%%% \RequirePackage[shortlabels,inline]{enumitem}
%%% \setlist{nolistsep}
\RequirePackage{titlesec}
\titleformat*{\section}{\Large\bfseries\color{ecolor}}
\titleformat*{\subsection}{\large\bfseries\color{ecolor}}
\titleformat*{\subsubsection}{\normalsize\bfseries\color{ecolor}}
\RequirePackage{hologo}
\let\openbox\relax
\newcommand{\globalcolor}[1]{%
    \color{#1}\global\let\default@color\current@color
}
% tikz
\RequirePackage{tikz}
\usetikzlibrary{angles,quotes}
\usetikzlibrary{shadows}
\newcommand*{\eitemi}{
    \tikz\draw[baseline, ball color=ecolor, draw=none] circle (2pt);}
\newcommand*{\eitemii}{
    \tikz\draw[baseline, fill=ecolor,draw=none,circular drop shadow] circle (2pt);}
\newcommand*{\eitemiii}{%
    \tikz\draw[baseline,fill=ecolor,draw=none] circle (2pt);}
%enumerate and itemize settings
\setlist[enumerate,1]{label=\color{ecolor}\arabic*.}
\setlist[enumerate,2]{label=\color{ecolor}(\alph*).}
\setlist[enumerate,3]{label=\color{ecolor}\Roman*.}
\setlist[enumerate,4]{label=\color{ecolor}\Alph*.}
\setlist[itemize,1]{label={\eitemi}}
\setlist[itemize,2]{label={\eitemii}}
\setlist[itemize,3]{label={\eitemiii}}
% source1: https://tex.stackexchange.com/questions/41408/a-five-level-deep-list
% source2: https://tex.stackexchange.com/questions/318199/change-color-of-itemize-bullet 
\RequirePackage{changepage} % for adjustwidth environment
\newcommand{\indenv}[2][0.5]{
    \begin{adjustwidth}{#1cm}{}
        #2
    \end{adjustwidth}
}
%number line in * environment, add \lebel{} and refer as \eqref{}
\newcommand\numberthis{\addtocounter{equation}{1}\tag{\theequation}}

% fig command
\RequirePackage{float}
\makeatletter
\define@key{figkeys}{width}{\def\fig@width{#1}}
\define@key{figkeys}{height}{\def\fig@height{#1}}
\define@key{figkeys}{label}{\def\fig@label{#1}}
\define@key{figkeys}{caption}{\def\fig@caption{#1}}

\newcommand{\fig}[2][]{%
    \begingroup
    \setkeys{figkeys}{width=0.5\textwidth,height=0.5\textheight,label={},caption={},#1}%
    \begin{figure}[H]
        \centering
        \includegraphics[width=\fig@width, height=\fig@height, keepaspectratio]{#2}
        \ifx\fig@caption\empty\else
            \caption{\fig@caption}
        \fi
        \label{fig:\fig@label}
    \end{figure}
    \endgroup
}
\makeatother

\RequirePackage{\clsfiles/shortcuts}

\RequirePackage[breakable, skins, theorems]{tcolorbox}
\theoremstyle{\thmstyle}
%use \tcblower for break
%use {Title}{Ref} lemma:Ref for reference, e.g. nameref, pageref, ref
\RequirePackage{\clsfiles/tcbthm}
\ifdefstring{\ALB@clsthmstyle}{formal}{
    \RequirePackage{\clsfiles/clsthm}
}{\relax}

\RequirePackage[skip=\skippar, indent=\indentpar]{parskip}
