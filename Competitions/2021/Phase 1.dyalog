P1←{100×(+/÷≢)⍵∊'GC'}
P1←100×≢÷⍨1⊥∊∘'GC'
P1←100×≢÷⍨∘≢∩∘'GC'
P2←⍳|⍨1+≢⍤⊣
P3←{⍵∘{⍵/⍺}¨↓0=⍺∘.|⍵}
P3←⊢∘⊂⊢⍤/⍨¨∘↓0=∘.|⍥,
P4←(4÷⍨2-⍨○1)××⍨
P4←(.5-⍨○÷4)××⍨
P5←{⌽⍣(a≡0)⊢a,⍵÷a←⊃⌽⍸0=⍵|⍨⍳⌊⍵*0.5} ⍝ crap
P6←{(≠/2|⍸'B'=⍵)∧'RKR'≡⍵∩'RK'} ⍝ broken
P7←{1≡≢∪+/↑(⊢,⍥(↓,⍥⊆1 1∘⍉)⌽)⍵}
P8←|-⍥(7 24 60⊥∘⌽3↑⌽)
P9←⌈⌿2-⍨/∘⍸1,1,⍨2≠/∘×2-/⊢
P10←{↑(-⍺)↑¨⊆⍵}
