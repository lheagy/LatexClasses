%=========================
% Exam.cls
% Provide Exam.cls class
%=========================

% ==== Identification ==== %
\ProvidesClass{Exam}
\NeedsTeXFormat{LaTeX2e}

\typeout{}
\typeout{ === Exam Class (Exam.cls) 2014 === }


% ==== Required Packages ====== %

\LoadClass[letterpaper, 12pt]{article}

\RequirePackage{fancyhdr}
\RequirePackage[top=1.2in,bottom=1.2in,left=1.1in,right=1.1in]{geometry}
\RequirePackage{graphicx}
\RequirePackage{empheq}
\RequirePackage{ifthen}
\RequirePackage{etoolbox}
\RequirePackage{color}
\RequirePackage{amsmath}
\RequirePackage{pdfpages}
\RequirePackage[titletoc]{appendix}
\RequirePackage{natbib}
\RequirePackage{amssymb}
\RequirePackage{makeidx}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{epstopdf}
\RequirePackage{float}
\RequirePackage{mdwlist}
\RequirePackage{fullpage}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{framed}
\RequirePackage{nameref}
\definecolor{GIFblue}{rgb}{0,0,0.7}
%\RequirePackage[colorlinks=true,linkcolor=GIFblue,citecolor=GIFblue,urlcolor=GIFblue,ps2pdf,bookmarks=true]{hyperref}
\typeout{   Required packages loaded}

\pagestyle{empty}

% ===== OPTIONS ======= %
\newif\if@showAnswers

\DeclareOption{showAnswers}{\@showAnswerstrue}
\DeclareOption{twoside}{\PassOptionsToPackage{twoside}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions

%=====================================================================
% Commands
%=====================================================================



\ifx\pdfoutput\undefined                         %LaTeX
  \RequirePackage[colorlinks=true,linkcolor=GIFblue,citecolor=GIFblue,urlcolor=GIFblue,ps2pdf,bookmarks=true]{hyperref}
\else                                            %PDFLaTeX
  \RequirePackage[colorlinks=true,linkcolor=GIFblue,citecolor=GIFblue,urlcolor=GIFblue,pdftex,bookmarks=true]{hyperref}
\pdfadjustspacing=1
\fi

% Course Info
\newcommand{\@course}{{}}
\newcommand{\@subtitle}{{}}
\newcommand{\@correct}{{}}
\newcommand{\@wrong}{{}}

\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\correct}[1]{\renewcommand{\@correct}{#1}}
\newcommand{\wrong}[1]{\renewcommand{\@wrong}{#1}}

\newcommand{\figdir}[1]{\graphicspath{{#1/}}}

% Set up counters for questions and subsections

\newcounter{QuestionNum}
\newcounter{SubQuestionNum}[QuestionNum]

\renewcommand{\theQuestionNum}{\arabic{QuestionNum}}
\renewcommand{\theSubQuestionNum}{\alph{SubQuestionNum}}

%\newcommand*{\question}[1]{\stepcounter{QuestionNum} %
%   {\flushleft\hfill\begin{minipage}{\dimexpr\textwidth-0.5cm}
%      \bigskip \textbf{Q\theQuestionNum.} #1
%      \end{minipage}}}

\renewcommand*{\part}[1]{\stepcounter{SubQuestionNum} %
  {\flushleft\hfill\begin{minipage}{\dimexpr\textwidth-1.25cm}
      \textbf{\theSubQuestionNum.} #1
      \end{minipage}}}


\newenvironment{question}%
{\stepcounter{QuestionNum} %
{\indent\ignorespaces}\theQuestionNum.~}%
{%
\ignorespacesafterend%
}

\renewcommand{\wrong}[1]%
{\stepcounter{SubQuestionNum}%
{\\\indent\indent\indent\ignorespaces}\theSubQuestionNum.~#1}%


%\ifthenelse{\boolean{\@showAnswers}}{%
\if@showAnswers%
  \newcommand*{\answer}[1]{%
  \flushleft\hfill\begin{minipage}{\dimexpr\textwidth-2cm}
    {\color{red} #1 \\}
    \end{minipage}}

  \renewcommand{\correct}[1]%
  {\stepcounter{SubQuestionNum}%
  {\\\indent\indent\indent\ignorespaces}%
  {\color{red}{\theSubQuestionNum.~#1%
  }}}

\else%
  \newcommand*{\answer}[1]%
    {\bigskip\bigskip\bigskip}

  \renewcommand{\correct}[1]%
  {\stepcounter{SubQuestionNum}%
  {\\\indent\indent\indent\ignorespaces}\theSubQuestionNum.~#1}%
\fi%



\renewcommand{\theenumi}{(\alph{enumi})}
\renewcommand{\labelenumi}{\theenumi}
\renewcommand{\theenumii}{\roman{enumii}}


% ==== DOCUMENT SETUP ====== %

\setlength{\headheight}{15pt}
\setlength{\headsep}{15pt}
\rhead{\small EOSC 350}\lhead{\small \@subtitle}
\lfoot{}\cfoot{\thepage}\rfoot{}
\pagestyle{fancy}

\AtBeginDocument{%
\thispagestyle{empty}
\begin{flushleft}
{\Large \bf{\@title}}  \\
\end{flushleft}
\sloppy
}%

\endinput
