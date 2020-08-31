P1←1∘=|∘⍳∘≢⊂⊢          ⍝ original tacit
P1←{1=⍵⊂⍨⍺|⍳≢⍵}       ⍝ original dfn

P1←{⍵⊂⍨(≢⍵)⍴⍺↑1}     ⍝ another alternative method dfn
P1←⊢⊂⍨≢⍤⊢⍴⊣↑1⍨       ⍝ the same thing in a tacit solution, very confusing!

P2←⌷∘'FDCBA'(⊂0 65 70 80 90∘⍸)     ⍝ tacit function, not sure how to remove parens
P2←{'FDCBA'[0 65 70 80 90⍸⍵]}      ⍝ dfn version

P3←{{⍺,(⊣,(⍎1⍕100×÷∘(≢w)))1-⍨≢⍵}⌸'ABCDF',(w←⍵)}  ⍝ horrible dfn but it does the job

P4←(,⍳8 8)∩((((3=+/¨∘|)⊢⍤/⊢),∘.,⍨¯2 ¯1 1 2)∘+⊂)    ⍝ tacits are cool

P5←(∨/2=/'n '∘,)¨    ⍝ pretty short, idk why they suggest using ⊆

⍝ needs ⎕IO←0 :(
P6←10|(⎕D,'AAADGJMPTW')∘⍸    ⍝ fun

P7←((≢⍤⊢,⊣)(⊣⍴(⊃(,/⊢)))((⌈¯0.5×⊣-⊣⌊≢⍤⊢)⌽↑)¨)    ⍝ terrible first draft tacit
P7←(,⍨∘≢)⍴∘∊((⌈¯0.5×⊣-⌊∘≢)⌽↑)¨    ⍝ improved by the big brains at the APL orchard
P7←(⌈¯2÷⍨0⌈-∘≢¨)⌽↑⍤0 1∘↑    ⍝ refactored to be more array oriented 

P8←+/2(.5*⍨(+/2*⍨-))/⊢⍴⍨1+≢  ⍝ first draft, looks ok, too many parens and ⍨s


draft - 2÷⍨(|∘(-/)(+/∘(×/)¨(0 1)(0 ¯1)∘.⊖⊂∘↑))
