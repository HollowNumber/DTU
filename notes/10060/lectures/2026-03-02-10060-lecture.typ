#import "@local/dtu-template:0.6.3":*
#import "@preview/physica:0.9.8": * 
#import "@preview/cetz:0.4.2"
#import "@preview/unify:0.7.1": qty

#show: dtu-physics-note.with(
  course: "10060",
  course-name: "Fysik (Polyteknisk grundlag)",
  title: "Lecture - March 02, 2026",
  date: datetime(year: 2026, month: 3, day: 2),
  author: "Mikkel M.H. Pedersen",
  semester: "2026 Spring"
)

#let meter(m) = qty(m, "m")


#definition(title: "Newtons love")[

 1. Lov  
  $
  sum F = 0 => v = "konstant"
  $


 2. Lov 

  $
  sum F = m a 
  $

 3. Lov

  $
  va(F)_(A B) = - va(F)_(B A)
  $ 


  #cetz.canvas({
   import cetz.draw: *  

   rect((0,0), (1,1), fill: gray, stroke: 0pt)
   content((0.5, 0.5), $m$ ) 
   line((-1,0), (3,0))
   line((1, 0.5), (3, 1.5) )
   mark((3.2,1.6), 25deg, symbol: ">", fill: black )
   content((2.5, 1.6), $va(F)$ ) 
   arc((1.9, 0.5), start: 0deg, delta: 25deg, mode: "OPEN" )
   content((2.2, 0.8), $theta$)
   line((1, 0.5), (3, 0.5), stroke: (dash: "dashed", paint: black)   )
   


 })


  #cetz.canvas({
   import cetz.draw: *  

   rect((0,0), (1,1), fill: gray, stroke: 0pt, name: "box")
   content("box.center",  $m$) 
   line((-1,0), (3,0))
   line("box", (3, 1.5), name: "force" )
   mark("force.end", 25deg, symbol: ">", fill: black)
   content((2.5, 1.6), $va(F)$ ) 
   arc((1.9, 0.5), start: 0deg, delta: 25deg, mode: "OPEN" )
   content((2.2, 0.8), $theta$)
   line("box", (3, 0.5), stroke: (dash: "dashed", paint: black)   )
   


 })

]




= Exercises



