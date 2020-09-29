pascal ← (-∘⌽⍳)⌽∘↑(⍕∘(⍳!⊣⍴-∘1)¨1+⍳) ⍝ bad pascal's triangle (not properly centered)

s←{(⊃¨{⊂⊃⍵}⌸⊢)⊃,/{(⊂⊃⍵)∘(,⍨)⍤⊂¨⊃,/10|(↓⍉2⊥⍣¯1⊢⎕A⍳'ABCDFGHLN')(+,⍥⊂-⍨)¨⊂⊃⍵}¨⍵}⍣12⊂,⍨⊂4⍴0

subarraypartition ← {(∧/¨(⊂⍺)=,¨(≢⍺),/⍵)⊂⍵}
