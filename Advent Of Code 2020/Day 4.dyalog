validate ← {+/7={+/⍎¨⊃,/'(.*):(.*)'⎕S'\1 ''\2'''¨' '(≠⊆⊢)⍵}¨{⍺,' ',⍵}/↑{⍵⊆⍨(⊂'')≢¨⍵}⊃⎕NGET'Day 4.txt' 1} 

⍝ Part 1
byr←iyr←eyr←hgt←hcl←ecl←pid←1⍨ ⋄ cid←0⍨
validate ⍬

⍝ Part 2
byr←(1920∘≤∧2002∘≥)∘⍎ ⋄ iyr←(2010∘≤∧2020∘≥)∘⍎ ⋄ eyr←(2020∘≤∧2030∘≥)∘⍎
hgt←{'c'∊⍵:(150∘≤∧193∘≥)⍎⍵~'cm' ⋄ 'i'∊⍵:(59∘≤∧76∘≥)⍎⍵~'in' ⋄ 0}
hcl←{'#'≠⊃⍵:0 ⋄ 7≠≢⍵:0 ⋄ (1↓⍵)∧.∊⊂'0123456789abcdef'}
ecl←'amb' 'blu' 'brn' 'gry' 'grn' 'hzl' 'oth'∊⍨⊂
pid←{0::0 ⋄ _←⍎⍵ ⋄ 9=≢⍵}
validate ⍬
