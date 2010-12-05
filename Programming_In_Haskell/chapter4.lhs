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

\begin{document}
\title{Chapter 4 Homework, from Lecture and Textbook}
\date{12/4/2010}
\maketitle

\section{Assigned in Lecture 4}
\begin{itemize}

\item Read Phil Wadler's Paper "Theorems for Free!" - www.mpi-sws.org/~dreyer/tor/papers/wadler.pdf \\  
Done, hardly understood a thing. I am going to need to return to this paper after studying some lambda calculus, etc etc.

\item Define safetail, so that it acts just like tail except that it maps the empty list to the empty list rather than being undefined for that input. Hint the function null can be used to test if a list is empty. Define using each of the following:
	\begin{itemize}
	\item A Conditional Expression
		\begin{code}
		mytail (x:xs) = xs
                csafetail xs = if xs == [] then [] else mytail xs
		\end{code}
	\item Guarded Equations
		\begin{code}
		gsafetail xs | xs == [] = []
		             | otherwise =  tail xs 
		\end{code}
	\item Pattern Matching
		\begin{code}
		psafetail [] = []
		psafetail (x:xs) = xs
		\end{code}

	\end{itemize}

\item Give three possible definitions for the logical (\textbar\textbar) or operator using pattern matching.
\begin{code}
(||1) :: Bool -> Bool -> Bool
True ||1 True = True
True ||1 False = True
False ||1 True = True
False ||1 False = False

(||2) :: Bool -> Bool -> Bool
x ||2 x = x 
x ||2 y = if x then True else y

(||3) :: Bool -> Bool -> Bool 
True ||3 _ = True
False ||3 x = x 
\end{code}

\item Redefine the following version of \&\& using conditionals rather than pattern matching
\begin{code}%This Comment prevents the code from being loaded as haskell, but allows it to be seen and formatted.
True && True = True
_ && _ = False
\end{code}

\begin{code}
(&&cond) x y = if x == y 
                  then if x == True
                          then True
                          else False
                  else False
\end{code}

 
\item Do the same for the following version:
\begin{code}%Another hide from Haskell Comment
True && b = b
False && _ = False
\end{code}

\begin{code} 
(&&cond2) x y = if x == True
                   then y
                   else False
\end{code}
\end{itemize}
\end{document}

