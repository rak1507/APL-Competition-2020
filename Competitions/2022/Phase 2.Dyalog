⍝ P1 Sub-space 
runs←{1∨.=(+\⍵)⍸⍤1⍳⍺}
fill{⍺⍴(⍳⍤≢⌈.×⊢)∧/1=(⍉⍤2+⍀⍤2⊢⍵⍴⍨(≢⍵),2,2÷⍨⊢/⍴⍵)⍸⍤¯1⍤2 1⍤2↑,¨,⍳⍺}
subspaces←{⍵{∊0 1+-⍨\2⍴⌽1⌽⍸⍺=⍵}⍤99 0⍳⌈/,⍵}
⍝ P2 Reshape

⍝ P3 Meetings

⍝ P4 Voting

⍝ P5 Base85

⍝ P6 Date
