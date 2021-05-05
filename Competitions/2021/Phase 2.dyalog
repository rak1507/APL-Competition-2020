⍝ Problem 1
{⍵⊂⍨(⍵='X')∨≠\⍵∊'123456789-/'} ⍝ partition into turns

⍝ Problem 2
MakeList←{⍵≡'':⍬ ⋄ to←⊣-×⍤-×∘⍳1+|⍤- ⋄ ⍎'([-¯]?\d+)-([-¯]?\d+)'⎕R'((\1)to(\2))'⊢⍵}
⍝ using ⍎ and regex is much easier than parsing without it
⍝ to could be dfns.to

⍝ Problem 3

⍝ Problem 4
{(+/÷≢)¨(¯1↓1↓m⊂⍳≢⍵)/⍨0>2×/2×⍤-/⍵/⍨m←1,2≠/⍵}
⍝ need to add length checks

⍝ Problem 5
lexf←{0≡⍺:,⊂''⋄,⍵∘.,⍵∇⍨⍺-1}
lexv←{1≡⍺:,¨⍵⋄,⍵,⍵∘.,⍵∇⍨⍺-1}
⍝ experimented with ∘.,/ vs ∘.,\ but the recursive solution was nicer
⍝ can't find a non branching non recursive solution

⍝ Problem 6

⍝ Problem 7
sseq←{w←⍵ ⋄ r←⍸{w↓⍨←⍵=⊃w,0}¨⍺ ⋄ r≡⍥≢⍵:1,⊂r ⋄ 0,⊂⍬}
lcsq←{∨/0=≢¨⍺⍵:''⋄=/⊃¨⍺⍵:(⊃⍺),(1↓⍺)∇1↓⍵⋄(⍺∇1↓⍵){⍺⍵⊃⍨⊃⍒≢¨⍺⍵}⍵∇⍨1↓⍺} ⍝ naive
{{m+⍺∧∨⍀∨\⍵≠m←⌈\⌈⍀⍵}⍣≡⍨ ⍺∘.=⍵} ⍝ create matrix to backtrack
⍝ BUGS: duplicates: see 'AAAAA' f 'AAA' :(
⍝ Hunt–Szymanski 
