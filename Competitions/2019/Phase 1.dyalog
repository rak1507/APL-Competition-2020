P1←1∘=|∘⍳∘≢⊂⊢          ⍝ original tacit
P1←{1=⍵⊂⍨⍺|⍳≢⍵}       ⍝ original dfn

P1←{⍵⊂⍨(≢⍵)⍴⍺↑1}     ⍝ another alternative method dfn
P1←⊢⊂⍨≢⍤⊢⍴⊣↑1⍨       ⍝ the same thing in a tacit solution, very confusing!

P2←⌷∘'FDCBA'(⊂1+65 70 80 90∘⍸)       ⍝ tacit function, not sure how to remove parens
P2←{(⊂1+65 70 80 90⍸⍵)⌷'FDCBA'}      ⍝ dfn version
