⍝ Problem 1
ValidGame←{
    ⎕IO←0
    basic←{(⍕⍵),'[',']',⍨∊⍕¨⍳10-⍵}¨⍳10              ⍝ basic turn, no strikes or spares
    main←'X',(2∘↑,'/',2∘↓)¨basic                    ⍝ with strikes + spares
    spare_end←('/[0123456789X]',⍨⊃)¨basic           ⍝ if frame 10 starts with a spare
    strike_end←'[0123456789X]'(⊂,⍨∘⊃)@0⊢'X',¨main   ⍝ if frame 10 starts with a strike
    first9←'(','){9}',⍨1↓∊'|',¨main                 ⍝ regex for the first 9 frames
    end←'(',')',⍨1↓∊'|',¨basic,spare_end,strike_end ⍝ regex for the end
    total←'-'@(=∘'0')⊢'^',first9,end,'$'            ⍝ entire regex
    (1≢≢⍴⍵)∧' '≡⊃0⍴⍵:0                              ⍝ ⍵ is a character vector
    (,⊂⍵)≡total ⎕S'&'⊢⍵                             ⍝ ⍵ matches regex (should be hardcoded for efficiency)
}

BowlingScore←{
    ⎕IO←0
    scores←2{10<⍵:10-⍺ ⋄ ⍵}/0,'-123456789X'⍳⍵ ⍝ score of each roll
    frames←scores⊆⍨10⌊+\(⍵='X')∨≠\scores<10   ⍝ partition into frames
    ⍝ if it is a strike or a spare, count 3 rolls
    ⍝ otherwise count two
    +\{+/⍵↑⍨2+10≤+/2↑⍵}¨3,/frames,0,0         ⍝ score for each frame + cumulative sum
}

⍝ Problem 2
MakeList←{⍵≡'':⍬ ⋄ to←⊣-×⍤-×∘⍳1+|⍤- ⋄ ⍎'([-¯]?\d+)-([-¯]?\d+)'⎕R'((\1)to(\2))'⊢⍵} ⍝ io←0
⍝ using ⍎ and regex is much easier than parsing without it
⍝ to could be dfns.to

MakeList←{
    ⍵≡'':⍬               ⍝ empty input
    to←⊣-×⍤-×1-⍨∘⍳1+|⍤-  ⍝ fill gaps
    ⍝ replace with regex
    ⍝ '44-42,-4--7,¯1-¯3,42-44' becomes '((44)to(42)),((-4)to(-7)),((¯1)to(¯3)),((42)to(44))'
    ⍝ and then eval with ⍎
    ⍎'([-¯]?\d+)-([-¯]?\d+)'⎕R'((\1)to(\2))'⊢⍵
}

⍝ Problem 3
Divvy←{a b←1⌈(⍺,≢⍵)[⍋⍺,≢⍵] ⋄ ⍵⊂⍨≠∘⍸⍣(⍺<≢⍵)⊢(⌊b÷a)+(a↑1⍴⍨a|b)}

⍝ Problem 4
{(+/÷≢)¨(¯1↓1↓m⊂⍳≢⍵)/⍨0>2×/2×⍤-/⍵/⍨m←1,2≠/⍵}
⍝ need to add length checks
 MinMax←{
     3>≢⍵:⍬ ⍝ needs to have at least 3 values
     mask←1,2≠/⍵ ⍝ mask of starts of unique runs
     diffs←2×⍤-/mask/⍵ ⍝ signs of differences (¯1 and 1)
     0≡≢diffs:⍬ ⍝ exit as 2×/ will error
     idx←(0>2×/diffs)/¯1↓1↓mask⊂⍳≢⍵ ⍝ filter groups of indices by occurrences of inflection points
     (+/÷≢)¨idx ⍝ average each group
 }


⍝ Problem 5
⍝lexf←{0≡⍺:,⊂''⋄,⍵∘.,⍵∇⍨⍺-1}
⍝lexv←{1≡⍺:,¨⍵⋄,⍵,⍵∘.,⍵∇⍨⍺-1}

⍝ Submitted:
lexf←{
   ⍝ Handle 0 case
   ⍺≡0:,⊂⍬
   ⍝ Create n copies ⍺⍴⊂,¨⍵
   ⍝ Outer product reduce ∘.,/
   ⍝ Flatten ,⊃
   ,⊃∘.,/⍺⍴⊂,¨⍵
}

lexv←{
   ⍝ Create n copies ⍺⍴⊂,¨⍵
   ⍝ Outer product scan ∘.,\
   ⍝ Merge with ⍪⍤3⍤,/
   ⍝ Flatten ,⊃
   ,⊃⍪⍤3⍤,/∘.,\⍺⍴⊂,¨⍵
}

⍝ Problem 6
Battleship←{
    ⎕IO←0
    ⍺⍺≢⍴⍵:0                       ⍝ correct shape
    w←0,0,⍨0⍪0⍪⍨⍵                 ⍝ padding
    scc←(⎕NS ⍬).(⍎'scc'⊣'scc'⎕CY'dfns')
    diag←⍺∨1∊¨⍳3 3
    i←,⍳⍴w
    ⍝ split matrix into chunks
    chunks←{⍵[⍋⍵]}¨i⊢∘⊂⌸⍨scc(≢⍉w)⊥¨¨i+∘⊂⍨¨,{⊂1-⍨⍸diag∧⍵=1 1⌷⍵}⌺3 3⊢1+w
    chunks/⍨←×w[⊃¨chunks]         ⍝ filter non-zero chunks
    straight←{
        1<≢u←∪2-/⍵:0              ⍝ all uniformly spaced
        (1+⍺⍺)≥+/|⊃u              ⍝ manhattan distance between gaps ≤ 1+(is diagonal?)
    }
    overlap←{
    ⍝ do ⍺ and ⍵ overlap?
        a b c d←⍺,⍵
        ccw←{a b c←⍵ ⋄ ≤.×/a-¨↓⌽@1⍉↑c b}
        (ccw a c d)(ccw a b c)∧.≠(ccw b c d)(ccw a b d)
    }⍥{⌽2⍴1⌽⍵}
    ∨/~⍺ straight¨chunks:0        ⍝ all straight
    chunks{∨/overlap/¨⊃,/(⍳≢⍺)↑¨↓∘.(,⍥⊂)⍨⍺}⍣⍺⊢0:0 ⍝ of the diagonals, do any overlap?
    ids←1-⍨w[⊃¨chunks]
    (ids≢⍥≢⍵⍵)∨(ids≢⍋⍋ids):0      ⍝ ids has length of the fleet and is a permutation vector
    (≢¨chunks)≡⍵⍵[ids]            ⍝ fleet matches
}
ValidBoard←{0 (⍺⍺ Battleship ⍵⍵) ⍵}
ValidBoard2←{1 (⍺⍺ Battleship ⍵⍵) ⍵}

⍝ Problem 7
sseq←{w←⍵ ⋄ r←⍸{w↓⍨←⍵=⊃w,0}¨⍺ ⋄ r≡⍥≢⍵:1,⊂r ⋄ 0,⊂⍬}
lcsq←{∨/0=≢¨⍺⍵:''⋄=/⊃¨⍺⍵:(⊃⍺),(1↓⍺)∇1↓⍵⋄(⍺∇1↓⍵){⍺⍵⊃⍨⊃⍒≢¨⍺⍵}⍵∇⍨1↓⍺} ⍝ naive
{{m+⍺∧∨⍀∨\⍵≠m←⌈\⌈⍀⍵}⍣≡⍨ ⍺∘.=⍵} ⍝ create matrix to backtrack
⍝ BUGS: duplicates: see 'AAAAA' f 'AAA' :(
⍝ Hunt–Szymanski 
{(' ',⍵)⍪⍺,⍉¯1↓⍉¯1↓(××1+(⌈⍀¯1⊖⍉)⍣2)⍣≡0,⍨0⍪⍨⍺∘.=⍵}
{{⍺×1+⌈⍀⌈\¯1⌽¯1⊖⍵}⍣≡⍨0,⍨0⍪⍨⍺∘.=⍵}
⍝ https://code.jsoftware.com/wiki/Essays/Longest_Common_Subsequence
