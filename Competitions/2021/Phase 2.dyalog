⍝ Problem 1
{⍵⊂⍨(⍵='X')∨≠\⍵∊'123456789-/'} ⍝ partition into turns

⍝ Problem 2
MakeList←{⍵≡'':⍬ ⋄ to←⊣-×⍤-×∘⍳1+|⍤- ⋄ ⍎'([-¯]?\d+)-([-¯]?\d+)'⎕R'((\1)to(\2))'⊢⍵} ⍝ io←0
⍝ using ⍎ and regex is much easier than parsing without it
⍝ to could be dfns.to

MakeList←{
    ⍵≡'':⍬               ⍝ empty input
    to←⊣-×⍤-×1-⍨∘⍳1+|⍤-  ⍝ fill gaps
    ⍝ replace with regex
    ⍝ '44-42,-4--7,¯1-¯3,42-44' becomes '((44)to(42)),((-4)to(-7)),((¯1)to(¯3)),((42)to(44))'
    ⍝ and then eval with ⍎
    ⍎'([-¯]?\d+)-([-¯]?\d+)'⎕R'((\1)to(\2))'⊢⍵
}

⍝ Problem 3
Divvy←{a b←1⌈(⍺,≢⍵)[⍋⍺,≢⍵] ⋄ ⍵⊂⍨≠∘⍸⍣(⍺<≢⍵)⊢(⌊b÷a)+(a↑1⍴⍨a|b)}

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
⍝lexf←{0≡⍺:,⊂''⋄,⍵∘.,⍵∇⍨⍺-1}
⍝lexv←{1≡⍺:,¨⍵⋄,⍵,⍵∘.,⍵∇⍨⍺-1}

⍝ Submitted:
lexf←{
   ⍝ Handle 0 case
   ⍺≡0:,⊂⍬
   ⍝ Create n copies ⍺⍴⊂,¨⍵
   ⍝ Outer product reduce ∘.,/
   ⍝ Flatten ,⊃
   ,⊃∘.,/⍺⍴⊂,¨⍵
}

lexv←{
   ⍝ Create n copies ⍺⍴⊂,¨⍵
   ⍝ Outer product scan ∘.,\
   ⍝ Merge with ⍪⍤3⍤,/
   ⍝ Flatten ,⊃
   ,⊃⍪⍤3⍤,/∘.,\⍺⍴⊂,¨⍵
}

⍝ Problem 6

ValidBoard←{
    ⍺⍺≢⍴⍵:0                ⍝ same shape
    ~∧/(∊⍵)∊0,⍳≢⍵⍵:0       ⍝ valid board numbers
    ships←(⊢,⍥⍪⍪¨)⍵⍵⍴¨⍳≢⍵⍵ ⍝ create ships horizontally and vertically
    ∧/∨/(∨/⍤,⍷∘⍵)¨ships    ⍝ are all ships on the board?
}

⍝ Problem 7
sseq←{w←⍵ ⋄ r←⍸{w↓⍨←⍵=⊃w,0}¨⍺ ⋄ r≡⍥≢⍵:1,⊂r ⋄ 0,⊂⍬}
lcsq←{∨/0=≢¨⍺⍵:''⋄=/⊃¨⍺⍵:(⊃⍺),(1↓⍺)∇1↓⍵⋄(⍺∇1↓⍵){⍺⍵⊃⍨⊃⍒≢¨⍺⍵}⍵∇⍨1↓⍺} ⍝ naive
{{m+⍺∧∨⍀∨\⍵≠m←⌈\⌈⍀⍵}⍣≡⍨ ⍺∘.=⍵} ⍝ create matrix to backtrack
⍝ BUGS: duplicates: see 'AAAAA' f 'AAA' :(
⍝ Hunt–Szymanski 
{(' ',⍵)⍪⍺,⍉¯1↓⍉¯1↓(××1+(⌈⍀¯1⊖⍉)⍣2)⍣≡0,⍨0⍪⍨⍺∘.=⍵}
{{⍺×1+⌈⍀⌈\¯1⌽¯1⊖⍵}⍣≡⍨0,⍨0⍪⍨⍺∘.=⍵}
⍝ https://code.jsoftware.com/wiki/Essays/Longest_Common_Subsequence
