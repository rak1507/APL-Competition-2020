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
 MinMax←{
     3>≢⍵:⍬ ⍝ needs to have at least 3 values
     mask←1,2≠/⍵ ⍝ mask of starts of unique runs
     diffs←2×⍤-/mask/⍵ ⍝ signs of differences (¯1 and 1)
     0≡≢diffs:⍬ ⍝ exit as 2×/ will error
     idx←(0>2×/diffs)/¯1↓1↓mask⊂⍳≢⍵ ⍝ filter groups of indices by occurrences of inflection points
     (+/÷≢)¨idx ⍝ average each group
 }


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
