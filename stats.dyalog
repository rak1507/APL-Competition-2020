stats←{ ⍝ some stats stuff
    res←0 2⍴0
    res⍪←'mean',⍥⊆m←(+⌿÷≢)⍵
    res⍪←'sum',⍥⊆+/⍵
    res⍪←'sum of squares',⍥⊆+/⍵×⍵
    res⍪←'var',⍥⊆var←(n←≢⍵)÷⍨+.×⍨⍵-m
    res⍪←'stdev',⍥⊆stdev←var*0.5
    res⍪←'devs',⍥⊆(⍵-m)÷stdev
    res
}
