P1←1∘=|∘⍳∘≢⊂⊢          ⍝ original tacit
P1←{1=⍵⊂⍨⍺|⍳≢⍵}       ⍝ original dfn

P1←{⍵⊂⍨(≢⍵)⍴⍺↑1}     ⍝ another alternative method dfn
P1←⊢⊂⍨≢⍤⊢⍴⊣↑1⍨       ⍝ the same thing in a tacit solution, very confusing!
