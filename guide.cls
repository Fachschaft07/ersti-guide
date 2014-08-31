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
\RequirePackage[left=0.75in,right=0.75in,top=0.75in,bottom=0.75in]{geometry}
\RequirePackage{wrapfig}
\RequirePackage{graphicx}
\RequirePackage[absolute]{textpos}
\RequirePackage{fancyhdr}
\RequirePackage{calc}
\RequirePackage[utf8]{inputenc}
\newcommand{\thisMonth}{\ifcase \month \or Januar \or Februar \or März \or April \or Mai %
\or Juni \or Juli \or August \or September \or Oktober \or November \or Dezember \fi}
\setcounter{secnumdepth}{0}
\renewcommand{\headrulewidth}{0pt}
\newcommand*\autowrap[1]{\wr@pletters#1\@nil}
\def\wr@pletters#1#2\@nil{#1\allowbreak\if&#2&\else\wr@pletters#2\@nil\fi}
\newcommand{\figureRight}[2]{\begin{wrapfigure}{r}{#1}
    \centering
    \includegraphics[width=#1]{#2}
\end{wrapfigure}}

\newcommand{\figureLeft}[2]{\begin{wrapfigure}{l}{0cm}
    \centering
    \includegraphics[width=#1]{#2}
\end{wrapfigure}}

\newcommand{\frontcover}[1]{\pagenumbering{gobble}\begin{textblock}{3}(0,0)\noindent\includegraphics[height=\paperheight, width=\paperwidth]{#1}\end{textblock}\leavevmode\newpage\pagenumbering{arabic}}
\newcommand{\backcover}[1]{\newpage\pagenumbering{gobble}\begin{textblock}{3}(0,0)\includegraphics[height=\paperheight, width=\paperwidth]{#1}\end{textblock}}
\let\oldemph\tableofcontents
\renewcommand{\tableofcontents}{\pagenumbering{gobble}\oldemph \newpage\pagenumbering{arabic}}


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