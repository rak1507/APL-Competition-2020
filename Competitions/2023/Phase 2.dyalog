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

vin←{
    allowed←⎕D,⎕A~'IOQ'
    ~∧/⍵∊allowed: ¯1        ⍝ banned characters
    key←0 1 2 3 4 5 6 7 8 9 ⍝ digit values
    key,←1 2 3 4 5 6 7 8    ⍝ A B C D E F G H
    key,←1 2 3 4 5   7   9  ⍝ J K L M N   P   R
    key,←  2 3 4 5 6 7 8 9  ⍝   S T U V W X Y Z
    digits←key[allowed⍳⍵]                             ⍝ numerical counterparts
    weight←8 7 6 5 4 3 2 10 0 9 8 7 6 5 4 3 2         ⍝ weights
    cd←{⍵=10:'X'⋄⍕⍵}11|weight +.× (8∘↑,0,¯8∘↑) digits ⍝ 9th place check digit
    res←(8↑⍵),cd,¯8↑⍵                                 ⍝ the VIN with the correct check digit 
    16≡≢⍵: res
    17≡≢⍵: ⍵ ≡ res
    ¯1    ⍝ some other length
}

sortVersions←{
  pkgs←,⊆⍵  ⍝ create vector from right argument
  ⍝ 'dyalog' 'jarvis' 1 11 7 'patch' ≡ convert 'dyalog-jarvis-1.11.7-patch'
  convert←{⍎¨@3 4 5⊢(~⍵∊'-.')⊆⍵}
  pkgs[⍋convert¨pkgs]  ⍝ sort by conversion
}
