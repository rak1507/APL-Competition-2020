data ← ⍎¨⊃⎕NGET'Day 1.txt' 1

⍝ Part 1
×/ ⌷∘data¨ ⍸data∊⍨2020 - data

⍝ Part 2
×/ ⌷∘data¨ ∪∊⍸data∊⍨2020-∘.+⍨data
