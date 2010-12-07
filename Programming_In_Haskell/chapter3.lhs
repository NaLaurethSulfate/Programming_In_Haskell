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
\title{Chapter 3 Homework:}
\date{12/6/2010} 
\maketitle


\textbf{Q:}   What are the types of the following values?
  

\begin{code}
['a','b','c']
('a','b','c')
[(False,'0'),(True,'1')]
([False,True],['0','1'])
[tail,init,reverse]
\end{code}



\textbf{A:}


\begin{code}%but hide as these aren't valid expressions
[Char]
(Char,Char,Char)
[(Bool,Char)]
([Bool],[Char])
[[a] -> [a]]
\end{code}


\textbf{Q:} What are the types of the following functions? 


\begin{code}
second xs = head (tail xs)
swap (x,y) = (y,x)
pair x y = (x,y)
double x = x * 2
palindrome xs = reverse xs == xs
twice f x = f (f x)
\end{code}
 

\textbf{A:}

\begin{code}
second :: [a] -> a
swap :: (a, b) -> (b, a)
pair :: a -> b -> (a, b)
double :: Num a => a -> a
palindrome :: [a] -> Bool 
twice :: (a -> a) -> a -> a
\end{code}


\textbf{Q:} Check answers using Hugs (GHCI).
 


\textbf{A:} All answers checked and were correct except fore palindrome, where
I forgot to put the typeclass constraint on the input. Revised answer as
follows:

\begin{code}
palindrome :: (Eq a) => [a] -> Bool
\end{code}


\textbf{Q:}  Why is it not feasible in general for function types to be
instances of the Eq class? When is it feasible? Hint: two functions of the
same type are equal if they always return equal results for equal arguments.



\textbf{A:} Functions cannot automatically be a part of the eq typeclass,
because it would require checking the following:

\begin{itemize}
\item That all possible inputs were the same (Not just the same type).
\item That all possible inputs were mapped into the same output. 
\end{itemize}


Since possible inputs are often infinite, this would not only be unfeasible
but impossible. Unless there is a simpler way to test for function equivalence
that I am unaware of.

\end{document}

