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
\title{Chapter 5 Homework:}
\date{12/6/2010} 
\maketitle


\textbf{Q:} A triple (x,y,z) of integers is called Pythagorean if x^2 + y^2 =
z^2. Using a List comprehension, define a function:


\begin{code}%hide from haskell
pyths :: Int -> [(Int,Int,Int)]
\end{code}

\hspace{4ex}that maps an integer n to all such triples with components in
[1..n]. For example:

\begin{code}%hide from haskell
> pyths 5
[(3,4,5),(4,3,5)]
\end{code}

\textbf{A:} 


\textbf{Q:} A positive integer is perfect if it equals the sum of all of its
factors, excluding the number itself. Using a list comprehension define a
function:


\begin{code}%hide from haskell
perfects :: Int -> [Int]
\end{code}

That returns the list of all perfect numbers up to a given limit. For example:

\begin{code}%hide from haskell
>perfects 500
[6,28,496]
\end{code}


\textbf{A:}  


\textbf{Q:} The scalar product of two lists of integers xs and ys of length n
is give by the sum of the products of the corresponding integers. Using a list
comprehension, define a function that returns the scalar product of two lists.


\textbf{A:}  


\textbf{Q:} 


\textbf{A:}  


\textbf{Q:} 


\textbf{A:}  


\textbf{Q:} 


\textbf{A:}  


\textbf{Q:} 


\textbf{A:}  


\textbf{Q:} 


\textbf{A:}  


\textbf{Q:} 


\textbf{A:}  


\textbf{Q:} 


\textbf{A:}  












\end{document}

