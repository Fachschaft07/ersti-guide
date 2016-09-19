\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{guide}[2014/08/31 Latex Class for the "erstie guide"]
\newif\if@imprint
\@imprintfalse
\newif\if@foreword
\@forewordfalse
\DeclareOption{imprint}{\@imprinttrue}
\DeclareOption{noimprint}{\@imprintfalse}
\DeclareOption{foreword}{\@forewordtrue}
\DeclareOption{noforeword}{\@forewordfalse}
\DeclareOption*{\InputIfFileExists{\CurrentOption.min}{}{
\PassOptionsToClass{\CurrentOption}{article}}}
\ProcessOptions \relax

\LoadClass{article}
\RequirePackage[left=0.5in,right=0.5in,top=0.5in,bottom=0.5in]{geometry}
\RequirePackage{wrapfig}
\RequirePackage{graphicx}
\RequirePackage[absolute]{textpos}
\RequirePackage{fancyhdr}
\RequirePackage{calc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}
\RequirePackage{color}
\RequirePackage{pifont}
\RequirePackage{lmodern,textcomp}
\RequirePackage{mathptmx}
\RequirePackage[scaled=.90]{helvet}
\RequirePackage{courier}
\RequirePackage[percent]{overpic}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[inline]{enumitem}
\RequirePackage{cleveref}

\newcommand{\thisMonth}{\ifcase \month \or Januar \or Februar \or März \or April \or Mai %
\or Juni \or Juli \or August \or September \or Oktober \or November \or Dezember \fi}
\setcounter{secnumdepth}{0}
\renewcommand{\headrulewidth}{0pt}
\newcommand{\changefont}[3]{\fontfamily{#1} \fontseries{#2} \fontshape{#3} \selectfont}
\def\flushboth{%
	\let\\\@normalcr
	\@rightskip\z@skip \rightskip\@rightskip
	\leftskip\z@skip
	\parindent 1.5em\relax}

\newcommand{\arrow}{\ding{213} }

\renewcommand\labelitemi{\ding{226}}
\newcommand{\doublebreak}{\\\linebreak}
\newcommand{\overlayingImage}[8]{\begin{figure}
		\centering
			\begin{overpic}[width=#1, angle=#2]{#3}
					\put(#4,#5){\includegraphics[width=#6, angle=#7]{#8}}
				\end{overpic}
				
	\end{figure}}
\newcommand{\email}[1]{\textcolor{blue}{\href{mailto:#1}{#1}}}

\newcommand{\red}[1]{\textcolor{red}{#1}}

\newcommand{\figureRight}[2]{\begin{wrapfigure}{r}{#1}
    \includegraphics[width=#1]{#2}
    \vspace{-1000mm}
\end{wrapfigure}}

\newcommand{\figureLeft}[2]{\begin{wrapfigure}{l}{0cm}
    \includegraphics[width=#1]{#2}
    \vspace{-1000mm}
\end{wrapfigure}}


\newcommand{\siteclick}{\space--\textgreater\space}
\newlist{sitenav}{description*}{4}
\setlist[sitenav]{before={\kern-1mm\noindent\color{red}},itemjoin={\siteclick\kern-2mm},mode=unboxed,afterlabel=\unskip{{~}}}

\newcommand{\frontcover}[1]{\pagenumbering{gobble}\begin{textblock}{3}(0,0)\noindent\includegraphics[height=\paperheight, width=\paperwidth]{#1}\end{textblock}\leavevmode\newpage\pagenumbering{arabic}}
\newcommand{\backcover}[1]{\newpage\pagenumbering{gobble}\raggedright\begin{textblock}{3}(0,0)\includegraphics[height=\paperheight, width=\paperwidth]{#1}\end{textblock}}
\let\oldemph\tableofcontents
\renewcommand{\tableofcontents}{\pagenumbering{gobble}\oldemph \newpage\pagenumbering{arabic}}

\let\oldurl\url
\renewcommand{\url}[1]{\textcolor{red}{\oldurl{#1}}}
\newcommand*{\@imprintLogo}{}
\newcommand{\imprintLogo}[1]{\gdef\@imprintLogo{#1}}
\newcommand*{\@imprintText}{}
\newcommand{\imprintText}[1]{\gdef\@imprintText{#1}}
\newcommand*{\@imprintPubliser}{}
\newcommand{\imprintPublisher}[1]{\gdef\@imprintPublisher{#1}}
\newcommand*{\@imprintNumberOfCopies}{}
\newcommand{\imprintNumberOfCopies}[1]{\gdef\@imprintNumberOfCopies{#1}}
\newcommand*{\@imprintEdition}{}
\newcommand{\imprintEdition}[1]{\gdef\@imprintEdition{#1}}
\newcommand*{\@imprintPrint}{}
\newcommand{\imprintPrint}[1]{\gdef\@imprintPrint{#1}}
\newcommand*{\@imprintEditing}{}
\newcommand{\imprintEditing}[1]{\gdef\@imprintEditing{#1}}
\newcommand*{\@imprintAuthors}{}
\newcommand{\imprintAuthors}[1]{\gdef\@imprintAuthors{#1}}
\newcommand*{\@imprintCopyRight}{}
\newcommand{\imprintCopyRight}[1]{\gdef\@imprintCopyRight{#1}}

\if@imprint
	\newcommand*\makeimprint[1][1]{
	\pagenumbering{gobble}
	\ifx\@imprintLogo\@empty  \else
		\begin{center}
		\includegraphics[width=\paperwidth-2in]{\@imprintLogo}	
		\end{center}
		\vspace{1cm}
	\fi
    \ifx\@imprintText\@empty \else
   		\raggedright
    	\textbf{\huge Impressum:}\normalsize\vspace{0.5cm}\linebreak
        \noindent\@imprintText
        \vspace{1cm}
		\newline
	\fi
	\ifx\@imprintPublisher\@empty \else
		\ifx\@imprintEditing\@empty \else
			\noindent
			\begin{minipage}[hbt]{0.475\textwidth}
				\raggedright
				\textbf{Herausgeber:}\vspace{0.5cm}\linebreak
				\@imprintPublisher\vspace{1cm}\linebreak
				\ifx\@imprintNumberOfCopies\@empty \else
					\noindent Auflage: \@imprintNumberOfCopies\linebreak
				\fi
				\ifx\@imprintEdition\@empty \else
					\noindent Ausgabe: \@imprintEdition\linebreak
				\fi
				\ifx\@imprintPrint\@empty \else
					\noindent Druck: \@imprintPrint\linebreak
				\fi
			\end{minipage}
			\hfill
			\begin{minipage}[hbt]{0.475\textwidth}
			\raggedleft
			\textbf{Redaktion/Layout:}\vspace{0.5cm}\linebreak
			\@imprintEditing\vspace{0.5cm}\linebreak
			\ifx\@imprintAuthors\@empty \else
			\raggedright
				\textbf{Autoren:}\vspace{0.5cm}\linebreak
				\@imprintAuthors
			\fi			
			\end{minipage}
		\fi
	\fi
	\ifx\@imprintCopyRight\@empty \else
	
	
		\fancypagestyle{firststyle}
		{
   			\fancyhf{}
   			\fancyfoot[C]{\textsuperscript{\textcopyright} \@imprintCopyRight}
		}
		\thispagestyle{firststyle}
	\fi
	\raggedright
	\newpage
	\pagenumbering{arabic}}
	\flushboth
\fi

\newcommand*{\@forewordContent}{}
\newcommand{\forewordContent}[1]{\gdef\@forewordContent{#1}}
\if@foreword
	\newcommand{\makeforeword}[1][1]{
	\ifx\@forewordContent\@empty \else
		\pagenumbering{gobble}
		\noindent\Large \textbf{Vorwort:}\vspace{1cm}\linebreak
		\normalsize\@forewordContent
		\newpage
		\pagenumbering{arabic}
	\fi
	}
\fi
