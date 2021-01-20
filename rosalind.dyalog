⍝ Counting DNA Nucleotides 
+/'ACGT'∘.=⊢
⍝ Transcribing DNA into RNA 
'U'@('T'∘=)
⍝ Complementing a Strand of DNA
'TAGC'⌷⍨∘⊂'ATCG'⍳⌽
⍝ Rabbits and Recurrence Relations
{⊃2↓⍵{⍵,⍨1 ⍺+.×2↑⍵}⍣⍺⊢1 1}/
⍝ Computing GC Content
{i m⌷⍨¨⊃⍒m←{100×(≢⍵)÷⍨+/⍵∊'CG'}¨,/↑⍵⊆⍨s⊣i←1↓¨⍵/⍨~s←∧⌿∨⌿¨'ACTG'∘.=⍵}
