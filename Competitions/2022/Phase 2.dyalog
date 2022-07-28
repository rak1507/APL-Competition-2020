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

reshape←{
    mat←(|⍺)⍴⍵  ⍝ reshape without reversals
    reverse_axis←{
    ⍝ Conditionally reverse
        elem axis←⍺
        ⌽[axis]⍣(elem<0)⊢⍵
    }
    ⊃reverse_axis/(⍺,¨⍳≢⍺),⊂mat ⍝ reverse each axis if required
}

reshape2←{
    s←⍺~⌊⍺                              ⍝ fractional values
    0≡≢s: ⍺ reshape ⍵                   ⍝ If no special values, use part 1
    ⍝ validity checking
    1<≢s:'Only 1 special value allowed'⎕SIGNAL 8
    ~0.5 1.5 2.5∊⍨|s←⊃s:'Special values can only be 0.5, 1.5, or 2.5'⎕SIGNAL 8

    n←×/⍴⍵                              ⍝ number of elements of ⍵
    whole←⍺~s                           ⍝ whole number axes
    axis←n÷×/|whole                     ⍝ what is the other axis?
    axis←{0.5=|s:⌊⍵ ⋄ ⌈⍵}axis           ⍝ floor if 0.5 else ceil
    axes←|axis@{s=⍵}⍺                   ⍝ create new axes
    data←{2.5=|s:(×/axes)↑,⍵ ⋄ ⍵}⍵      ⍝ pad with ↑ if 2.5=|s
    signed←axes××⍺                      ⍝ convert to original signs
    signed reshape data                 ⍝ use part 1 reshape
}

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
