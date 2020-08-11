P1←1∘=|∘⍳∘≢⊂⊢          ⍝ original tacit
P1←{1=⍵⊂⍨⍺|⍳≢⍵}       ⍝ original dfn

P1←{⍵⊂⍨(≢⍵)⍴⍺↑1}     ⍝ another alternative method dfn
P1←⊢⊂⍨≢⍤⊢⍴⊣↑1⍨       ⍝ the same thing in a tacit solution, very confusing!

P2←⌷∘'FDCBA'(⊂0 65 70 80 90∘⍸)     ⍝ tacit function, not sure how to remove parens
P2←{'FDCBA'[0 65 70 80 90⍸⍵]}      ⍝ dfn version

P3←{{⍺,(⊣,(⍎1⍕100×÷∘(≢w)))1-⍨≢⍵}⌸'ABCDF',(w←⍵)}  ⍝ horrible dfn but it does the job

P4←∩∘(,∘.,⍨⍳8)((((3=+/¨∘|)⊢⍤/⊢),∘.,⍨¯2 ¯1 1 2)∘+⊂    ⍝ tacits are cool
