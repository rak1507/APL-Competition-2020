P1 ← ≢∘∪⌈\
P1 ← {≢∪⌈\⍵}
⍝ get running maximum, and number of unique elements

P2 ← ⌊,1∘| ⍝ fork, floor ravel 1 mod (decimal part)

P3 ← {↑⍕(⊂⊣,'*'⍴⍨⊢∘≢)⌸,+/¨⍳⍵} 
