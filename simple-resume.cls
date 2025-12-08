%% Simple Resume Class File
% A minimal, custom resume template for software/machine learning engineers
%
% Author: Kirill Bobyrev
% License: MIT
%
% Requirements:
% - LuaLaTeX or XeLaTeX for font support (use: lualatex or xelatex)
% - Source Sans Pro font (included in texlive-fonts-extra package)
% - FontAwesome 5 (included in texlive-fonts-extra package)

\ProvidesClass{simple-resume}[2024/12/08 v1.0 Simple Resume Class]
\NeedsTeXFormat{LaTeX2e}

% Inherit from article class
\LoadClass{article}

%-------------------------------------------------------------------------------
% Required packages
%-------------------------------------------------------------------------------
\RequirePackage{geometry}          % Page layout
\RequirePackage{xcolor}            % Colors
\RequirePackage{fontspec}          % Font management
\RequirePackage{fontawesome5}      % Icons
\RequirePackage{hyperref}          % Hyperlinks
\RequirePackage{parskip}           % Paragraph spacing
\RequirePackage{fancyhdr}          % Headers and footers
\RequirePackage{etoolbox}          % Programming tools

%-------------------------------------------------------------------------------
% Color definitions
%-------------------------------------------------------------------------------
\definecolor{headercolor}{HTML}{2C3E50}
\definecolor{sectioncolor}{HTML}{C0504D}
\definecolor{textcolor}{HTML}{2C3E50}
\definecolor{linkcolor}{HTML}{2C3E50}

%-------------------------------------------------------------------------------
% Font configuration
%-------------------------------------------------------------------------------
\defaultfontfeatures{Ligatures=TeX}
\setmainfont{Source Sans Pro}[
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Semibold,
  Scale=1.0,
]

%-------------------------------------------------------------------------------
% Page layout
%-------------------------------------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\setlength{\parskip}{0.4em}

%-------------------------------------------------------------------------------
% Hyperlink setup
%-------------------------------------------------------------------------------
\hypersetup{
  colorlinks=true,
  linkcolor=linkcolor,
  urlcolor=linkcolor,
  pdfborderstyle={/S/U/W 1}
}

%-------------------------------------------------------------------------------
% Personal information storage
%-------------------------------------------------------------------------------
\newcommand*{\@firstname}{}
\newcommand*{\@lastname}{}
\newcommand*{\@position}{}
\newcommand*{\@address}{}
\newcommand*{\@mobile}{}
\newcommand*{\@email}{}
\newcommand*{\@homepage}{}
\newcommand*{\@github}{}
\newcommand*{\@linkedin}{}
\newcommand*{\@x}{}

% Commands to set personal information
\newcommand*{\name}[2]{\renewcommand*{\@firstname}{#1}\renewcommand*{\@lastname}{#2}}
\newcommand*{\position}[1]{\renewcommand*{\@position}{#1}}
\newcommand*{\address}[1]{\renewcommand*{\@address}{#1}}
\newcommand*{\mobile}[1]{\renewcommand*{\@mobile}{#1}}
\newcommand*{\email}[1]{\renewcommand*{\@email}{#1}}
\newcommand*{\homepage}[1]{\renewcommand*{\@homepage}{#1}}
\newcommand*{\github}[1]{\renewcommand*{\@github}{#1}}
\newcommand*{\linkedin}[1]{\renewcommand*{\@linkedin}{#1}}
\newcommand*{\x}[1]{\renewcommand*{\@x}{#1}}

%-------------------------------------------------------------------------------
% Header separator customization
%-------------------------------------------------------------------------------
\newcommand*{\acvHeaderSocialSep}{\quad\textbar\quad}

%-------------------------------------------------------------------------------
% Header command
%-------------------------------------------------------------------------------
\newcommand*{\makecvheader}[1][C]{%
  \begin{center}
    {\Huge\bfseries\color{headercolor}\@firstname\ \@lastname}
    \vspace{0.2em}
    
    {\large\color{textcolor}\@position}
    \vspace{0.15em}
    
    {\color{textcolor}\@address}
    \vspace{0.25em}
    
    {\small\color{textcolor}
      \href{tel:\@mobile}{\faMobile\ \@mobile}
      \acvHeaderSocialSep
      \href{mailto:\@email}{\faEnvelope\ \@email}
      \acvHeaderSocialSep
      \href{https://\@homepage}{\faHome\ \@homepage}
      \acvHeaderSocialSep
      \href{https://github.com/\@github}{\faGithub\ \@github}
      \acvHeaderSocialSep
      \href{https://www.linkedin.com/in/\@linkedin}{\faLinkedin\ \@linkedin}
      \acvHeaderSocialSep
      \href{https://x.com/\@x}{\faTwitter\ \@x}
    }
  \end{center}
  \vspace{0.6em}
}

%-------------------------------------------------------------------------------
% Footer command
%-------------------------------------------------------------------------------
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot[L]{\small\color{textcolor}#1}
  \fancyfoot[C]{\small\color{textcolor}#2}
  \fancyfoot[R]{\small\color{textcolor}#3}
}

%-------------------------------------------------------------------------------
% Section command
%-------------------------------------------------------------------------------
\newcommand{\cvsection}[1]{%
  \vspace{0.3em}
  {\Large\bfseries\color{sectioncolor}#1}
  \vspace{0.1em}
  \par\noindent{\color{sectioncolor}\rule{\textwidth}{0.8pt}}
  \vspace{0.2em}
}

% Override default \section to use cvsection styling
\renewcommand{\section}[1]{\cvsection{#1}}

%-------------------------------------------------------------------------------
% Paragraph environment
%-------------------------------------------------------------------------------
\newenvironment{cvparagraph}{%
  \vspace{0.1em}
  \color{textcolor}
}{%
  \par
  \vspace{0.3em}
}

%-------------------------------------------------------------------------------
% Entry environment (for future use)
%-------------------------------------------------------------------------------
\newenvironment{cventries}{%
  \vspace{0.3em}
}{%
}

% Entry command: \cventry{position}{company}{location}{date}{description}
\newcommand*{\cventry}[5]{%
  \vspace{0.3em}
  \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
    {\large\bfseries\color{headercolor}#2} & {\color{textcolor}#3} \\
    {\color{textcolor}\textit{#1}} & {\color{textcolor}#4} \\
  \end{tabular*}
  \ifstrempty{#5}{}{%
    \vspace{0.2em}
    {\color{textcolor}#5}
  }%
  \vspace{0.3em}
}

% Item list environment (for cventry descriptions)
\newenvironment{cvitems}{%
  \vspace{-0.3em}
  \begin{itemize}
    \setlength{\itemsep}{0.2em}
    \setlength{\parskip}{0pt}
    \setlength{\parsep}{0pt}
}{%
  \end{itemize}
  \vspace{0.3em}
}

% Skills environment
\newenvironment{cvskills}{%
  \vspace{0.3em}
}{%
}

\newcommand*{\cvskill}[2]{%
  \noindent
  \begin{tabular*}{\textwidth}{@{}p{0.2\textwidth}@{\hskip 0.05\textwidth}p{0.75\textwidth}@{}}
    {\bfseries\color{headercolor}#1} & {\color{textcolor}#2}
  \end{tabular*}
  \vspace{0.2em}
}
