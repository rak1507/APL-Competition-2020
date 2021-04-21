pascal ← (-∘⌽⍳)⌽∘↑(⍕∘(⍳!⊣⍴-∘1)¨1+⍳) ⍝ bad pascal's triangle (not properly centered)

s←{(⊃¨{⊂⊃⍵}⌸⊢)⊃,/{(⊂⊃⍵)∘(,⍨)⍤⊂¨⊃,/10|(↓⍉2⊥⍣¯1⊢⎕A⍳'ABCDFGHLN')(+,⍥⊂-⍨)¨⊂⊃⍵}¨⍵}⍣12⊂,⍨⊂4⍴0
p←({⍵/⍨≠⊃¨⍵}⊢,⍥,((+,-)↓⍉2⊥⍣¯1⊢⎕A⍳'ABCDFGHLN')∘.{10|⍵,⍨⊂⍺+⊃⍵}⊢)⍣≡⊢⊂⊂4⍴0

subarraypartition ← {(∧/¨(⊂⍺)=,¨(≢⍺),/⍵)⊂⍵}


freqs ← ⍸⍣¯1{⍵[⍋⍵]}
freqs2 ← {(2⌷[2]⍵)[⍋1⌷[2]⍵]}{⍺,≢⍵}⌸

a ← (+,-)↓⍉2⊥⍣¯1⊢⎕A⍳'ABCDFGHLN'

{p[⍸⍵≡¨⍥⊆⊃¨p←({⍵/⍨≠⊃¨⍵}⊢,⍥,((+,-)↓⍉2⊥⍣¯1⊢⎕A⍳'ABCDFGHLN')∘.{10|⍵,⍨⊂⍺+⊃⍵}⊢)⍣≡⊢⊂⊂4⍴0]}0 0 0 0

{(⍴⍵)↑⍸⍣¯1{⍵[⍋⍵]}⍵{⍵/⍨∧/¨(⍵≤⊂⍴⍺⍺)∧⍵>⊂0 0}⊃,/km¨⍸⍵}

step ← {(a b n) ← ⍵ ⋄ (b-a)÷(n-1)}
range ← {(⊃⍵)+(step ⍵)×0,⍳(⊃⌽⍵)-1} 
int ← {(step ⍵)×+/⍺⍺ range ⍵} 

 rect←{
     (a b n)←⍵
     step←n÷⍨b-a
     range←a+step×1-⍨⍳n
     step×+/⍺⍺ range
 }
 
  trap←{
     (a b n)←⍵
     step←n÷⍨b-a
     range←a+step×1-⍨⍳n+1
     2÷⍨step×+/2+/⍺⍺ range
 }


 lambertW←{
     ⍺←1J1
     deriv←{dx←0.00001 ⋄ 2÷⍨dx÷⍨-/⍺⍺¨⍵+1 ¯1×dx}
     nr←{⍵-(⍺⍺ ⍵)÷(⍺⍺ deriv ⍵)}
     (⍵-⍨⊢×*)nr⍣≡⍺
 }
