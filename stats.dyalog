stats←{ ⍝ 1 var stats
    res←0 2⍴0
    res⍪←'mean',⍥⊆m←(+⌿÷≢)⍵
    res⍪←'sum',⍥⊆+/⍵
    res⍪←'sum of squares',⍥⊆+/⍵×⍵
    res⍪←'var',⍥⊆var←(n←≢⍵)÷⍨+.×⍨⍵-m
    res⍪←'stdev',⍥⊆stdev←var*0.5
    res⍪←'devs',⍥⊆(⍵-m)÷stdev
    res
}

least_squares←{
    S←+.×-×⍥(+/)÷≢⍤⊣
    n←≢⍺ ⋄ sxx←S⍨⍺ ⋄ syy←S⍨⍵ ⋄ sxy←⍺ S ⍵
    (n÷⍨+/⍵-b×⍺)(b←sxy÷sxx)(sxy÷0.5*⍨sxx×syy)
}

⎕IO←0
tpdf←((1+⊢×÷⍨)*¯2÷⍨1+⊣)×(!2÷⍨1-⍨⊣)÷(.5*⍨○⍤⊣)×∘!1-⍨2÷⍨⊣ ⍝ student's t distribution
tcdf←{2÷⍨n÷⍨+/2+/⍺ tpdf ⍵-n÷⍨⍳(n←1000)×4-¯200}
invtcdf←{f←⍵-⍨⍺∘tcdf⋄h←÷100⋄{⍵-(2×h×f ⍵)÷-/f¨⍵+h,-h}⍣(0.0001>|⍤-)1} 
⍝ 1.812 = 3 (⍎⍕) 10 invtcdf 0.95 https://www.sqa.org.uk/sqa/files_ccc/AHStatisticsDataBooklet.pdf

chi←1⊥⊢(∊-×-÷⊢)+/∘.×+⌿÷1⊥∊ ⍝ takes mat argument
