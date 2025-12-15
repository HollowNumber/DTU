#import "@local/dtu-template:0.5.1":*

#show: dtu-note.with(
  course: "01001",
  course-name: "Matematik 1a (Polyteknisk grundlag)",
  title: "Lecture - November 18, 2025",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2025 Fall",
)

#set math.mat(delim: "[")
#set math.vec(delim: "[")

= Egen Vektorer og Egenværdier



#definition(title: "12.1.1")[
  $V$ vektorrum over $FF$,  $dim(V) = n$

  $
    L: V -> V "lineær afbildning"
  $

  Hvis $bold(v) in V (bold(v) != bold(0))$ opfylder

  $
    L(bold(v)) = lambda dot bold(v) "for" lambda in FF
  $

  Så kaldes $bold(v)$ en egenvektor og $lambda$ den tilhørende egenværdi.

  Problem: (egenværdi problemet) givet $L$ bestem alle mulige egenværdier og egenvektoreer


  Bemærk:

  $L(bold(0)) = bold(0) $ og derfor gælder $L(bold(0) = lambda dot bold(0)$ for alle $lambda in FF$

  Udelukkes i definitionen $bold(V) != bold(0)$
]



#definition(title: "12.1.2")[
  $
    bold(A) &in FF^(n times n) "en kvradratisk matrix" \
    bold(v) &in FF^n (bold(v) = bold(0)) "som opfylder" \
    bold(A) dot bold(v) &= lambda dot bold(v) "for" lambda in FF "kaldes" \
    "en egenvektor for" &bold(A) "og" lambda "den tilhørende egenværdi"
  $
]


#example(title: "12.1.2")[

  $bold(A) = mat(1,2;2,1) in RR^(2 times 2)$


  $
    bold(A) dot vec(1,0) = vec(1,2)
  $
]




= Examples
