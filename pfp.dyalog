R←(0 0)(0 100)(50 100)(0 50)(50 0)
A←(70 0)(70 100)(120 100)(120 0)(60 50)(140 50)
K←(150 0)(150 100)(150 50)(200 0)(150 50)(200 100)
b2s←{W X Y Z←⍵ ⋄ '[WXYZ]'⎕R{⍕⍎⍵.Match}⊢'<path d="M W C X, Y, Z" stroke="black" fill="transparent"/>'}
bezier←{CM←(⌽¯1↑⍨n),⍨(¯1↑⍨n),6×=/↑⍳2⍴n←2-⍨≢⍵⋄M←4 1 0[2⌊|-/↑⍳2⍴n]⋄B←(0⌷⍵)⍪(M⌹⍨CM+.×⍵)⍪⊃⌽↓⍵⋄⍵∘{(⍵⌷⍺)(3÷⍨2 1+.×a)(3÷⍨1 2+.×a←B⌷⍨⊂0 1+⍵)(⍺⌷⍨⍵+1)}¨⍳1-⍨≢⍵}
svg←'<svg width="300" height="300" stroke-width="3" xmlns="http://www.w3.org/2000/svg">'
svg,←'<rect width="100%" height="100%" fill="white"/>' ⍝ background
svg,←'</svg>',⍨,⊃,/⊃,/b2s¨∘bezier¨50+⍉¨200-@1¨⍉∘↑¨R A K
svg ⎕NPUT 'pfp.svg' 1
