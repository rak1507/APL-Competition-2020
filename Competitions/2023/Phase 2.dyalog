⍝ Problem 1
rna←{'U'@('T'=⊢)⊢⍵}
revc←{⌽'ATCG'['TAGC'⍳⍵]}
decode←{
    ⎕IO←0                     ⍝ Allows for easier base arithmetic
    map←'FFLLSSSSYY--CC-WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG'
    codons←⍵⍴⍨3,⍨⌊3÷⍨≢⍵       ⍝ split into groups of 3
    map⌷⍨⊂4⊥⍉'UCAG'⍳codons ⍝ translate by interpreting in base 4
}
prot←{(decode ⍵)~'-'} ⍝ decode and remove stop signal

readFASTA←{
    lines←⊃⎕NGET ⍵ 1                ⍝ Read lines of file
    groups←(⊢⊂⍨'>'=⊃¨)lines         ⍝ Partition into groups
    ⍝ For each group, return the taxon name + concatenated parts
    {(1↓⊃' '(≠⊆⊢)⊃⍵)(∊1↓⍵)}¨groups
}

orf←{
    s←⊃⌽⊃readFASTA ⍵
    extract←{
        ps←decode rna ⍵          ⍝ convert dna to protein
        ss←⍸ps='-' ⋄ ms←⍸ps='M'  ⍝ where ps = stop and start
        ends←(ss,0)[1+ss⍸ms]     ⍝ find ending - for each M (or 0 if there is none)
        ms{ps[⍺↓¯1+⍳⍵]}¨ends     ⍝ slice ps to find each substring
    }
    frames←,0 1 2∘.↓s,⍥⊆revc s   ⍝ all 6 possible frames
    ∪''~⍨⍥⊆⊃,/extract¨frames     ⍝ extract distinct ORFs
}
