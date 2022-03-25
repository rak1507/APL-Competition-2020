⍝ P1 Sub-space 
runs←{1∨.=(+\⍵)⍸⍤1⍳⍺}
fill←{⍺⍴(⍳⍤≢⌈.×⊢)∧/1=(⍉⍤2+⍀⍤2⊢⍵⍴⍨(≢⍵),2,2÷⍨⊢/⍴⍵)⍸⍤¯1⍤2 1⍤2↑,¨,⍳⍺}
fill2←{⍺⍴(⍳⍤≢⌈.×⊢)∧⌿1=(2 3 1⍉+⍀⍤2⊢⍵⍴⍨(≢⍵),2,2÷⍨⊢/⍴⍵)⍸⍤1⍤¯1⍉↑,¨,⍳⍺}
subspaces←{⍵{∊0 1+-⍨\2⍴⌽1⌽⍸⍺=⍵}⍤99 0⍳⌈/,⍵}
subspaces←⊢{∊(1--)\2⍴⌽1⌽⍸⍺=⍵}⍤99 0∘⍳⌈/⍤,
⍝ P2 Reshape

⍝ P3 Meetings

⍝ P4 Voting

⍝ P5 Base85
Base85←{
    ⎕IO←0                            ⍝ 0 based indexing is easier for this
    C←80=⎕DR⍵                        ⍝ 0 for encode 1 for decode
    X Y←C⌽4 5 ⋄ A B←C⌽85 256         ⍝ constants
    ((≢⍵)-x×X)↓(⍺⌷⍨⊂)⍣(~C),⍉(Y/A)⊤B⊥⍉x X⍴⍺⍳⍣C⊢⍵↑⍨X×x←⌈X÷⍨≢⍵
}


⍝ P6 Date
