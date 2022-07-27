⍝ P1 Sub-space 
runs←{1∨.=(+\⍵)⍸⍤1⍳⍺}

 runs←{
     1∨.=(+\⍵)⍸⍤1⍳⍺
⍝                ⍳⍺  all indices
⍝        (+\⍵)       boundaries
⍝             ⍸⍤1    0 - below, 1 - between, 2 - above
⍝    1∨.=            where are the ones?
 }

 fill←{
     ⎕IO←0                     ⍝ nicer for this problem
     rank←≢size←⍺              ⍝ rank and size of the result
     vals←(×/size)⍴0           ⍝ raveled matrix of values
     ⍝{m[a⊥x/⍨a∧.>x←(1-⍨n↑⍵)+⍤0 1⊢(n↓⍵)⊥⍣¯1⍳×/n↓⍵]←⍺+1}
     amend←{
     ⍝ Function to modify vals as required
         start←rank↑⍵
         shape←rank↓⍵
         coords←shape⊤⍳×/shape  ⍝ all coordinates - fast version of ⍉↑,¨,⍳shape
         coords+⍤1 0←start-1       ⍝ increment to start position
         coords/⍨←size∧.>coords    ⍝ keep only the coordinates within bounds
         coords⊥⍨←size             ⍝ convert back to indices
         ⊢vals[coords]⊢←⍺          ⍝ set values
     }
     _←(1+⍳≢⍵)amend⍤0 1⊢⍵    ⍝ amend all values (discard amend results)
     size⍴vals               ⍝ reshape
 }

 subspace←{
     ⎕IO←0 ⍝ Nicer for this problem
     size←⍴⍵
     flat←,⍵
     find←{
         where←(⊣/,⊢/)⍸⍺=⍵  ⍝ first and last index of the subspace
         coords←size⊤where  ⍝ convert to coords
         ,⍉1+-⍨\coords      ⍝ shape←1+-⍨\coords and start←1+⊣/coords
     }
     flat find⍤1 0⊢1+⍳⌈/flat  ⍝ Find all subspaces
 }

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
