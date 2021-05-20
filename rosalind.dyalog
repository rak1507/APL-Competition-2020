⍝ Counting DNA Nucleotides 
+/'ACGT'∘.=⊢
⍝ Transcribing DNA into RNA 
'U'@('T'∘=)
⍝ Complementing a Strand of DNA
'TAGC'⌷⍨∘⊂'ATCG'⍳⌽
⍝ Rabbits and Recurrence Relations
{⊃2↓⍵{⍵,⍨1 ⍺+.×2↑⍵}⍣⍺⊢1 1}/
⍝ Computing GC Content
{i m⊃⍨¨⊃⍒m←{100×(≢⍵)÷⍨+/⍵∊'CG'}¨,/↑⍵⊆⍨s⊣i←1↓¨⍵/⍨~s←∧⌿∨⌿¨'ACTG'∘.=⍵}
⍝ Counting Point Mutations
+/≠⌿
⍝ Mendel's First Law
{(2!+/⍵)÷⍨4÷⍨+/∊4⌊2⊥¨¨(⊢↓¨⍨1+⍳∘≢)↓∘.,⍨⍵/2 1 0}
⍝ Translating RNA into Protein 
r←'FFLLSSSSYYZZCCZWLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG'
{⊃s⊆⍨~<\'Z'=s←r[4⊥⍉'UCAG'⍳↑⍵⊂⍨1 0 0⍴⍨≢⍵]}
⍝ Finding a Motif in DNA
{1+⍸⊃⍷⍨/⍵}
⍝ Consensus and Profile
{↑o,⍨⊂'ACGT'⌷⍨⊂⊃⍤⍒⍤1⍉m⊣o←↓⍕'ACGT',':',m←+⌿⍤2⊢'ACGT'∘.=↑,/↑⍵⊆⍨~'R'∊¨⍵}
⍝ Mortal Fibonacci Rabbits
{2⊃⍵{⍵,⍨-/⍵[1-⍨(≢⍵)⌊1(⍺+1)2]}⍣⍺⊢1 1 1 0}/
⍝ Overlap Graphs
{↑{⍺,' ',⍵}/↑,/↑⌷∘(1↓¨n/⍵)¨¨⍸⍉∘.{(⍺≢⍵)∧(3↑⍺)≡¯3↑⍵}⍨⊃,/,/¨⍵⊆⍨~n←'R'∊¨⍵}
⍝ Calculating Expected Offspring
{2÷⍨+/⍵/4 4 4 3 2 0}


⍝ Completing a Tree
tree←{
    ⎕IO←1 ⍝ more convenient :(
    n←⊃⍵
    cons←1↓⍵
    1-⍨≢∪∨.∧⍨⍣≡(∘.=⍨⍳n)∨∨∘⍉⍨n n↑⍸⍣¯1{⍵⌷⍨⊂⍋⍵}cons
}
