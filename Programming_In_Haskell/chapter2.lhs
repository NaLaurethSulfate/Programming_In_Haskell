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
\title{Chapter 2  Homework:}
\date{12/6/2010} 
\maketitle


\textbf{Q:} Try out slides 2-8 and 14-17 using hugs (GHCI).


\textbf{A:} Done. Again no real proof.



\textbf{Q:} Fix the syntax errors in the program bellow and test your solution
using HUGS (GHCI).


\begin{code}
N = a 'div' length xs
        where 
            a = 10
            xs = [1..5]
\end{code}



\textbf{A:} The errors were: No parenthesis around ``length x", forward ticks
rather than back ticks around ``div" and a capital N.

\begin{code}
n = a `div` (length x)
    where 
        a = 10
        xs = [1..5]
\end{code}




\textbf{Q:} Show how the library function ``last" can be defined using the
functions introduced in this lecture.



\textbf{A:}  The easiest way that I can think of defining last (explicit recursion)


\begin{code}
mylast (x:[]) = x
mylast (x:xs) = mylast xs
\end{code}


\textbf{Q:} Can you think of another possible definition?


\textbf{A:} This is the definition I could explain to a four year old: 


\begin{code}
myflatten (x:_) = x
smylast (xs) = myflatten (drop ((length xs) - 1) xs) 
\end{code}


\textbf{Q:} Similarly can you show how the library function ``init" (that
removes the last element of a list) can be defined two different ways?


\textbf{A:} Explicit recursion version of init:


\begin{code}
myinit (x:[]) = []
myinit (x:xs) = x: myinit xs
\end{code}


\hspace{4ex}Other version of init:


\begin{code}
smyinit xs = take ((length xs) - 1) xs
\end{code}


\textbf{Q:} Parenthesize the following arithmetic expressions: 


\begin{enumerate}
\item \(2 ^ 3 * 4\)
\item \(2 * 3 + 4 * 5\)
\item \(2 + 3 * 4 ^ 5\)
\end{enumerate}

\hspace{4ex}My assumption is to parenthesize to make PEMDAS explicit.



\textbf{A:} 
\begin{enumerate}
\item\((2^3) * 4\)
\item\((2 * 3) + (4 * 5)\)
\item\(2 + (3 * (4 ^ 5))\)
\end{enumerate}


\textbf{Q:} Work through examples from this chapter using HUGS (substitute
GHCI). 


\textbf{A:} Done. Again no way of substantiation.


\end{document}

