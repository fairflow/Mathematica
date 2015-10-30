(* ::Package:: *)

BeginPackage["Monads`"]


zero::usage="The zero of a monad (if any)";
unit::usage="The unit of a monad";
bind::usage="The bind function of a monad";
zipping::usage="The zipper for a monad (if any)";
comprehend::usage="A monad comprehension (requires a zero)";
zipgen::usage="The constructor for parallel generation";
generator::usage="The constructor for generation";
comprehend::nozip="Zipping not implemented for `1`";
removeDups::usage="Remove duplicates from a list";
Maybe::usage="The (name of the) Maybe monad";
Sets::usage="The (name of the) Set monad";


Begin["`Private`"];


Maybe[]:=Maybe (* make Maybe into a constructor *)
Sets[]:=Sets (* do the same with Sets *)


zero[List]:={}
unit[List]:={#}&
bind[List]:=Flatten[#1 /@ #2,1]&
zipping[List]:=Thread


SetAttributes[comprehend,HoldRest]


comprehend[m_,e_,True]:=unit[m][e]
comprehend[m_,e_, q_]:=comprehend[m,e,q,True]
comprehend[m_,e_,generator[p_,l_],q__]:=Module[{ok},ok[_]:=zero[m];ok[p]:=comprehend[m,e,q];bind[m][ok,l]]
comprehend[m_,e_,zipgen[gens__],q__]:=Block[{x},
comprehend[m,e,generator[comprehend[m,x,generator[generator[x_,_],{gens}]],zipping[m][comprehend[m,l,generator[generator[_,l_],{gens}]]]],q]]
(* assume everything not a generator or a parallel generator is a test *)
comprehend[m_,e_,b_,q__]:=If[b,comprehend[m,e,q],zero[m]]


zero[Maybe]:=None
unit[Maybe]:=Some
bindMaybe[_,None]:=None
bindMaybe[f_,Some[x_]]:=f[x]
bind[Maybe]:=bindMaybe
zipping[Maybe]:=
(Message[comprehend::nozip,Maybe];zipping[])


pluck[e_,l_]:=Block[{x},comprehend[List,x,generator[x_,l],x=!=e]]


removeDups[{}]:={}
removeDups[{h_,l___}]:=Prepend[pluck[h,removeDups[{l}]],h]


zero[Sets]:={}
unit[Sets]:={#}&
bind[Sets]:=removeDups[Flatten[#1 /@ #2,1]]&
zipping[Sets]:=
(Message[comprehend::nozip,Sets];zipping[])


End[]


EndPackage[]
