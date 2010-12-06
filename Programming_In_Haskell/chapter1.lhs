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
\title{Chapter  1 Homework:}
\date{12/6/2010} 
\maketitle


\textbf{Q:} Give another possible calculation for the result of ``double (double
2)". The two already given were:
\begin{itemize} 
\item 
\begin{code}%lets hide this from Haskell again
double (double 2) =>
double (2 + 2) =>
double 4 =>
4 + 4 =>
8 
\end{code}

\item
\begin{code}%Haskell hide
double (double 2) =>
double 2 + double 2 =>
(2 + 2) + double 2 =>
4 + double 2 =>
4 + (2 + 2)
4 + 4 =>
8
\end{code}
\end{itemize}



\textbf{A:} This seems like kind of a lame answer, but there are not very many
possibilities that aren't trivial. This is derived from the first way of
calculating ``double (double 2)" where the inner double is applied first.
\begin{code}
double (double 2) =>
double (2+2) =>
(2+2) + (2+2) =>
4 + (2+2) =>
4 + 4 =>
8
\end{code}

\hspace{4ex}Where the arrows represent the application of the inner double, the outer
double, the first addition, the last addition and the middle addition
respectively.



\textbf{Q:} Show that sum[x] = x for any number x.



\textbf{A:} Lets make up a definition for sum:
\begin{code}
mysum :: Num a => [a] -> a
mysum [] = 0
mysum [x] = x
mysum (x:xs) = x + mysum xs
\end{code}

\hspace{4ex}In this definition it is clear from the pattern matching that mysum [x] = x
HAS to be true in this definition, since without it it would never be able to
pattern match the list of one element, and since this is a recursive
definition would fail for all lists passed in (except the empty list) without
this part of the definition. Obviously this must be true since in real life
a recursive definition of sum needs to map the empty list to the identity
function for addition, and performing the identity function on x results in x.


\textbf{Q:} Define a function ``product" that produces the product of a list
of numbers, and show using your definition that product [2,3,4] = 24.


\textbf{A:} MyProd
\begin{code}
myprod :: Num a => [a] -> a
myprod xs = foldr (*) 1 xs
\end{code}


\hspace{4ex}To show that it gets 24 from the input of [2,3,4] I will step
through the program by hand:


\begin{code}
myprod [2,3,4] =>
foldl (*) 1 [2,3,4] => 
foldl (*) (1 * 2) [3,4] =>
foldl (*) (1 * 2 * 3) [4] =>
foldl (*) (1 * 2 * 3) [] =>
1 * 2 * 3 * 4 * 1 =>
24
\end{code}

\hspace{4ex}Although I am mildly unsatisfied with this or other definitions that I came up
with insofar as they always produce 1 for the result of passing the empty list
(because that is the identity function for multiplication), though it seems to
me like the result should actually be 0. The only way I can think of fixing
that would be to use conditionals:

\begin{code}
myprod2 :: Num a => [a] -> a
myprod2 xs | xs == [] = 0
           | otherwise = foldl (*) 1 xs
\end{code}

\hspace{4ex}Which while it accomplishes the task at hand is neither elegant nor concise. 


\textbf{Q:} How should the following definition of the function qsort be
modified so that it produces a reverse sorted version of a list?

\begin{code}
qsort [] = [] 
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
               where
                   smaller = [ a | a <- xs, a <= x]
                   larger  = [ b | b <- xs, b > x]
\end{code}


\textbf{A:} Now to reverse this we would want to still put x in the middle
with a list before and after but the larger would have to come first, and the
smaller second. Other than that I don't think any change is necessary. 


\begin{code}
rqsort [] = [] 
rqsort (x:xs) = rqsort larger ++ [x] ++ rqsort smaller
               where
                   smaller = [ a | a <- xs, a <= x]
                   larger  = [ b | b <- xs, b > x]
\end{code}


\textbf{Q:}  What would be the effect of replacing \(\leq\) by \(<\) in the definition of qsort?



\textbf{A:} I think that the result would be the simultaneous removal of
duplicated elements anywhere in the list in addition to sorting. 

\begin{code}
rdqsort [] = []
rdqsort (x:xs) = rdqsort smaller ++ [x] ++ rdqsort larger
where smaller = [ a | a <- xs, a < x]
      larger  = [ b | b <- xs, b > x]
\end{code}

\hspace{4ex}Let's Test it out...  I am correct!


\end{document}
