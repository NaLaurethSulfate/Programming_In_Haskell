\documentclass[12pt,letterpaper]{article} 

\usepackage{listings}

\lstloadlanguages{Haskell}

\lstnewenvironment{code}
    {\lstset{}%
      \csname lst@SetFirstLabel\endcsname}
    {\csname lst@SaveFirstLabel\endcsname}
    \lstset{
      basicstyle=\small\ttfamily,
      flexiblecolumns=false,
      basewidth={0.5em,0.45em},
      literate={+}{{$+$}}1 {/}{{$/$}}1 {*}{{$*$}}1 {=}{{$=$}}1
               {>}{{$>$}}1 {<}{{$<$}}1 {\\}{{$\lambda$}}1
               {\\\\}{{\char`\\\char`\\}}1
               {->}{{$\rightarrow$}}2 {>=}{{$\geq$}}2 {<-}{{$\leftarrow$}}2
               {<=}{{$\leq$}}2 {=>}{{$\Rightarrow$}}2 
               {\ .}{{$\circ$}}2 {\ .\ }{{$\circ$}}2
               {>>}{{>>}}2 {>>=}{{>>=}}2
               {|}{{$\mid$}}1               
    }

\setlength{\parindent}{-4ex}
\setlength{\parskip}{2ex}




\begin{document} 
\title{Chapter 4 Homework:}
\date{12/4/2010} 
\maketitle

\textbf{Q:} Read Phil Wadler's Paper ``Theorems for Free!" -
www.mpi-sws.org/~dreyer/tor/papers/wadler.pdf   


\textbf{A:} Finished. Hardly understood a thing. I need to get a better
general idea of: lambda calculus (esp. notation), category theory, and most of
the vocabulary used in this paper. Will place items on the to-do list.


\textbf{Q:} Define safetail, so that it acts just like tail except that it maps the
empty list to the empty list rather than being undefined for that input.
\textit{Hint}: the function null can be used to test if a list is empty.


\hspace{4ex}Define using each of the following: 


\begin{enumerate} 
\item A Conditional Expression 
\item Guarded Equations 
\item Pattern Matching 
\end{enumerate}


\textbf{A:} Here are all three versions, each of which use the following
definition of the ``unsafe" version of tail, called ``mytail", though this could
have easily been incorporated into each definition.


\begin{code}
mytail (x:xs) = xs 
\end{code} 


\begin{enumerate}
\item Conditional:
\begin{code}
csafetail xs = if xs == [] 
                  then [] 
                  else mytail xs
\end{code}

\item Guarded Equations:
\begin{code} 
gsafetail xs | xs == [] = [] 
             | otherwise =  tail xs 
\end{code} 

\item Pattern Matching:
\begin{code} 
psafetail [] = [] 
psafetail (x:xs) = xs 
\end{code}
\end{enumerate}


\textbf{Q:} Give three possible definitions for the
logical (\textbar\textbar) ``or" operator using pattern matching.  


\textbf{A:} The third seems to be preferable, and not sure that the other two
are that distinct.


\begin{code}
(||1) :: Bool -> Bool -> Bool
True ||1 True = True
True ||1 False = True
False ||1 True = True
False ||1 False = False

(||2) :: Bool -> Bool -> Bool
x ||2 x = x
x ||2 y = if x 
             then True 
             else y


(||3) :: Bool -> Bool -> Bool
True ||3 _ = True
False ||3 x = x 
\end{code}


\textbf{Q:} Redefine the following version of ``\&\&" using conditionals rather than
pattern matching:


\begin{code}%This Comment prevents the code from being loaded as Haskell, but allows it to be seen and formatted in LaTex 
True && True = True 
_ && _ = False 
\end{code}


\textbf{A:}
\begin{code} 
(&&cond) x y = if x == y 
                  then if x == True 
                          then True 
                          else False
                  else False 
\end{code}

 
\textbf{Q:} Do the same for the following version: 


\begin{code}%Another hide from Haskell comment 
True && b = b 
False && _ = False 
\end{code}


\textbf{A:} 
\begin{code} 
(&&cond2) x y = if x == True 
                   then y 
                   else False 
\end{code}
\end{document}

