%%
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{nenuthesis}
[2014/05/06 0.0.3 Northeast Normal University Thesis Template]
\def\nenuthesis{\textsc{NenuThesis}}
\def\version{0.0.3}

\LoadClass[a4paper,titlepage,11pt,twoside,openany]{book}

\newif\ifnenuIsZhCN
\DeclareOption{zhcn}{\nenuIsZhCNtrue}

\ExecuteOptions{zhcn}
\ProcessOptions\relax

\RequirePackage{ifpdf,ifxetex}

% Packages -----------------------------------------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[usenames]{color}
\RequirePackage{fancyhdr}
\RequirePackage{nomencl}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{url}
\urlstyle{tt}

\RequirePackage{hyperref}
\hypersetup{
	unicode=false,
	CJKbookmarks=true, 
%	bookmarks=true,
    bookmarksnumbered=true,
	bookmarksopen=true, 
	bookmarksopenlevel=1, 
	breaklinks=true,
	colorlinks=false, 
	plainpages=false, 
%	pdfpagelabels, 
	pdfborder=0 0 0,
	linktocpage=false,
	linkcolor=black, 
	anchorcolor=black, 
	citecolor=black
}

\bibliographystyle{plain}

\RequirePackage{lscape}
\RequirePackage{graphicx}

%% 表格
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{threeparttable}
\RequirePackage{tabularx}
\RequirePackage{slashbox}
\RequirePackage{multirow}
\RequirePackage{dcolumn}
\RequirePackage{colortbl}
\RequirePackage{array}

\RequirePackage{ulem}
\RequirePackage{ifthen}
\RequirePackage{caption}
\RequirePackage{subfig}
\RequirePackage{float}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{commath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}


%% 页边距:上 2.5cm,下 2.5cm,左 3cm,右 2.5cm;装订线位置:左侧,1.5cm。
\RequirePackage[top=2.5cm,bottom=2.5cm,left=3.0cm,right=2.5cm,includehead,includefoot]{geometry}

%% 是否需要pdf交叉链接？
%\RequirePackage[bookmarks,raiselinks,pageanchor,hyperindex]{hyperref}
\RequirePackage{natbib}
\RequirePackage{titlesec}
\RequirePackage{titletoc}

% 字体设置 -----------------------------------------------
%% 中文字体太多都有版权了\ldots
\RequirePackage{xunicode,xltxtra,fontspec}
\RequirePackage[CJKnumber,CJKtextspaces,CJKmathspaces,slantfont,boldfont]{xeCJK}
\punctstyle{kaiming}

\setCJKmainfont[BoldFont={SimSun}, ItalicFont={SimSun}]{SimSun}
%\setCJKsansfont{Droid Sans Fallback}
\setCJKsansfont{Microsoft YaHei}
\setCJKmonofont{SimSun}
\setCJKfamilyfont{song}{SimSun}
\setCJKfamilyfont{hei}{Microsoft YaHei}
\setCJKfamilyfont{fs}{Adobe Fangsong Std}
\setCJKfamilyfont{kai}{Adobe Kaiti Std}
\setCJKfamilyfont{li}{SimSun} % todo: 用隶书字体代替
\setCJKfamilyfont{you}{SimSun} % todo: 用幼圆字体代替

\setmainfont{Droid Serif}
\setsansfont{Droid Sans}
\setmonofont{Droid Sans Mono}

\newcommand{\song}{\CJKfamily{song}}    % 宋体
\def\songti{\song}

\newcommand{\fs}{\CJKfamily{fs}}        % 仿宋体
\def\fangsong{\fs}

\newcommand{\kai}{\CJKfamily{kai}}      % 楷体
\def\kaishu{\kai}

\newcommand{\hei}{\CJKfamily{hei}}      % 黑体
\def\heiti{\hei}

\newcommand{\li}{\CJKfamily{li}}        % 隶书
\def\lishu{\li}

\newcommand{\you}{\CJKfamily{you}}      % 幼圆
\def\youyuan{\you}


%% 字号 ----------------------------------------
\newlength\nenu@linespace
\newcommand{\nenu@choosefont}[2]{%
   \setlength{\nenu@linespace}{#2*\real{#1}}%
   \fontsize{#2}{\nenu@linespace}\selectfont}
\def\nenu@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \nenu@choosefont{##1}{#2}}}
\nenu@define@fontsize{chuhao}{42bp}
\nenu@define@fontsize{xiaochu}{36bp}
\nenu@define@fontsize{yihao}{26bp}
\nenu@define@fontsize{xiaoyi}{24bp}
\nenu@define@fontsize{erhao}{22bp}
\nenu@define@fontsize{xiaoer}{18bp}
\nenu@define@fontsize{sanhao}{16bp}
\nenu@define@fontsize{xiaosan}{15bp}
\nenu@define@fontsize{sihao}{14bp}
\nenu@define@fontsize{banxiaosi}{13bp}
\nenu@define@fontsize{xiaosi}{12bp}
\nenu@define@fontsize{dawu}{11bp}
\nenu@define@fontsize{wuhao}{10.5bp}
\nenu@define@fontsize{xiaowu}{9bp}
\nenu@define@fontsize{liuhao}{7.5bp}
\nenu@define@fontsize{xiaoliu}{6.5bp}
\nenu@define@fontsize{qihao}{5.5bp}
\nenu@define@fontsize{bahao}{5bp}
% Pre format ---------------------------------------

% title
\DeclareRobustCommand{\nstitlec}{}
\DeclareRobustCommand{\nstitlee}{}
\DeclareRobustCommand{\nstitle}[2]{
  \renewcommand{\nstitlec}{#1}
  \renewcommand{\nstitlee}{#2}
}

% author
\DeclareRobustCommand{\nsauthornamec}{}
\DeclareRobustCommand{\nsauthornamee}{}
\DeclareRobustCommand{\nsauthorid}{}
\DeclareRobustCommand{\nsauthor}[3]{
  \renewcommand{\nsauthornamec}{#1}
  \renewcommand{\nsauthornamee}{#2}
  \renewcommand{\nsauthorid}{#3}
}

% mentor teacher
\DeclareRobustCommand{\nsmentorc}{}
\DeclareRobustCommand{\nsmentore}{}
\DeclareRobustCommand{\nsmentortitle}{}
\DeclareRobustCommand{\nsmentor}[3]{
	\renewcommand{\nsmentorc}{#1}
	\renewcommand{\nsmentore}{#2}
	\renewcommand{\nsmentortitle}{#3}
}

% grade
%\DeclareRobustCommand{\nsgrade}{}
\DeclareRobustCommand{\nsgrade}[1]{
	\renewcommand{\nsgrade}{#1}
}


%  major 
\DeclareRobustCommand{\nsmajorc}{}
\DeclareRobustCommand{\nsmajore}{}
\DeclareRobustCommand{\nsmajor}[2]{
	\renewcommand{\nsmajorc}{#1}
	\renewcommand{\nsmajore}{#2}
}

% college
\DeclareRobustCommand{\nscollegec}{}
\DeclareRobustCommand{\nscollegee}{}
\DeclareRobustCommand{\nscollege}[2]{
	\renewcommand{\nscollegec}{#1}
	\renewcommand{\nscollegee}{#2}
}

% make date
\DeclareRobustCommand{\nsdateyear}{}
\DeclareRobustCommand{\nsdatemonth}{}
\DeclareRobustCommand{\nsdate}[2]{
	\renewcommand{\nsdateyear}{#1}
	\renewcommand{\nsdatemonth}{#2}
}

\DeclareRobustCommand{\nsheadc}{}
\DeclareRobustCommand{\nshead}[1]{
	\renewcommand{\nsheadc}{#1}
}

%\titlecontents{chapter}[1.5em]{}%
%{第 \thecontentslabel{} 章\hspace{1em}}{}{\titlerule*[10pt]{.}\contentspage}

\titleformat{\chapter}[hang]{\sanhao\song}{\thechapter}{1em}{}{}
\titlespacing{\chapter}{0pt}{0.2\baselineskip}{0.2\baselineskip}
\titlecontents{chapter}[2.2em]{}%
{\hspace{1em}\thecontentslabel\hspace{1em}}{}{\titlerule*[10pt]{.}\contentspage}

\titleformat{\section}[hang]%
  {\xiaosi\heiti}{\thesection}{1em}{}{}
\titlespacing{\section}%
  {0pt}{0.2\baselineskip}{0.2\baselineskip}
\titlecontents{section}[2.2em]{}%
{\hspace{1em}\thecontentslabel\hspace{1em}}{}{\titlerule*[7pt]{.}\contentspage}

\titleformat{\subsection}[hang]%
  {\wuhao\heiti}{\thesubsection}{1em}{}{}
\titlespacing{\subsection}%
  {0pt}{0.1\baselineskip}{0.1\baselineskip}
\titlecontents{subsection}[3.0em]{}%
{\hspace{2em}\thecontentslabel\hspace{1em}}{}{\titlerule*[5pt]{.}\contentspage}

\titleformat{\subsubsection}[hang]{\wuhao}{\thesubsubsection}{1em}{}{}
\titlespacing{\subsubsection}{0pt}{0.0\baselineskip}{0.0\baselineskip}

% Other settings ------------------------------------------------
%% 行距
\linespread{1.5} 

\newcommand{\pozhehao}{\kern0.3ex\rule[0.8ex]{2em}{0.1ex}\kern0.3ex}

% 页眉和页脚 ---------------------------------------
\RequirePackage{fancyhdr}
%% clear all fields
\fancyhead{} 
\fancyfoot{}

%% report和book都是chapter首頁默认沒有頁眉
%% 想办法重载plain样式
\makeatletter
\let\ps@plain\relax
\let\ps@plain=\ps@fancy
\makeatother

%% 页眉：
%% 论文题目，宋体五号；距页上边1.5cm
%% @TODO 单面打印时，页眉内容靠左边（为了环保，暂时不管）
%% 双面打印时，页眉内容奇数页靠左，偶数靠右
\fancyhead[CO,CE]{\song \wuhao \nsheadc}
%% 页脚：
%% 页码，字体 Times New Roman，五号加黑
%% 奇数页右侧,偶数页在左侧,页脚距页下边 1.5cm,
\fancyfoot[CE,CO]{ \textbf{\thepage}}

\renewcommand{\headrulewidth}{0.4pt} 
\renewcommand{\footrulewidth}{0.4pt}

\pagestyle{fancy}

% 本地化 -------------------------------------------
\ifnenuIsZhCN
    \newtheorem{assumption}{假设}[chapter]
    \newtheorem{definition}{定义}[chapter]
    \newtheorem{proposition}{命题}[chapter]
    \newtheorem{lemma}{引理}[chapter]
    \newtheorem{theorem}{定理}[chapter]
    \newtheorem{axiom}{公理}[chapter]
    \newtheorem{corollary}{推论}[chapter]
    \newtheorem{exercise}{练习}[chapter]
    \newtheorem{example}{例}[chapter]
    \newtheorem{remark}{注释}[chapter]
    \newtheorem{problem}{问题}[chapter]
    \newtheorem{conjecture}{猜想}[chapter]

    \renewcommand\contentsname{目\hspace{1em}录}
    \renewcommand\listfigurename{插图索引}
    \renewcommand\listtablename{表格索引}
    \newcommand\listequationname{公式索引}
    \newcommand\equationname{公式}
    \renewcommand\bibname{参考文献}
    \renewcommand\indexname{索引}
    \renewcommand\figurename{图}
    \renewcommand\tablename{表}
\else
    \newtheorem{assumption}{Assumption}[chapter]
    \newtheorem{definition}{Definition}[chapter]
    \newtheorem{proposition}{Proposition}[chapter]
    \newtheorem{lemma}{Lemma}[chapter]
    \newtheorem{theorem}{Theorem}[chapter]
    \newtheorem{axiom}{Axiom}[chapter]
    \newtheorem{corollary}{Corollary}[chapter]
    \newtheorem{exercise}{Exercise}[chapter]
    \newtheorem{example}{Example}[chapter]
    \newtheorem{remark}{Remark}[chapter]
    \newtheorem{problem}{Problem}[chapter]
    \newtheorem{conjecture}{Conjecture}[chapter]
\fi


\endinput
