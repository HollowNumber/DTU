#import "@local/dtu-template:0.6.0": *
#import "@preview/cetz:0.4.2" 
#import "@preview/cetz-plot:0.1.3"
#show: dtu-physics-note.with(
  course: "10060",
  course-name: "Fysik (Polyteknisk grundlag)",
  title: "Lecture - February 02, 2026",
  date: datetime.today(),
  author: "Mikkel M.H. Pedersen",
  semester: "2026 Fall"
)

= Kinematik 1D

Givet et objekt der starter i $x_1$ og slutter i $x_2$, så kan man finde dets gennemsnits hastighed ved

$
overline(v) = (Delta x)/(Delta t)
$

== Instantan Hastighed

Gennemsnitlig acc.

$
overline(a)_x = (Delta v_-/(Delta t)
$


Instantan acc.

$
a_x = (d v_x)/(d t)
$


$
a = (d^2 x)/(d t^2) = (d v)/(d t)
$


#note-box[
  Bemærk at $a !=$ positiv $v$
]

== Udledning af ligninger for bevægelse med konstant acceleration

1. Linær sammenligning i tid $v_x = v_(0x) + a_x dot t$
2. gennemsnits hastighed $overline(v) = (v_x - v_(0x))/2 + (2v_(0x)$


== Løsningsstrategi

- Koordinatsystem (sæt $t = 0$ når $x_0 = 0$, om muligt)
- Vælg positiv retning (den retning, hvor $x$, $v$ og $a$ regnes for positve)
- Omform de givne oplysning til symbolske størrelser
- Angiv kendte størrelser, angiv de ønskede størrelser
- Vær opmærksom på "skjulte" informationer
- Opstil de relevante ligninger
- Enhedskontrol og grænsekontrol


#example[
  Fang en person med konstant acceleration

  1. $x_n(t) = v_(0,m) dot t + 1/2 a + t^2 $, $x_B (t) = x_0 + v_(0,- dot t$ 

  $
  x_B (t^ *) = x_0 + L <=> x + v_(0.- dot t^* <=> t^* = L/(v_(0,-)
  $


  $
  x_m (t^*) = x_0 + L = v_(0,m) dot L/(v_(0,-) + 1/2 a dot (L/v_(0,- )^2
  $


  $
  x_0 &= 1.0 \
  L &= 1.2 \
  v_(0,- &= 1 m/s \
  v_(0,m) &= 0.9 m/s 
  $


  // Insert solution
]



= Problems

#physics-problem(number: 1)[
  // Pictured a graph of y axis velocity and x axis time

  In which of the marked points (A-- does the wolf not move?

  - A, E and H


  In which of the marked points (A-- does the wolf not accelerate

  - C and F

  In which time intervals does the wolf approximately move at constant acceleration?

- A-B
- B-C
- D-E and G-H
- C-D and E-F
- *B-C and F-G*
- Don’t know

At what time is the worlf furthest away from the starting point at $t = 0 "s"$?

- C
- E
- F
- *H*
- Don’t know

]



#physics-problem(number: 2)[
  A particle starts from rest and moves rightward direction. The position of hte particle is shown at different points in time. The time interval between each point is the same for all points.

- *A*
- B
- C
- None of the graphs fits the motion of the particle
- Don’t know

]


#physics-problem(number: 3)[
In which points (A, B, C, D and/or - does the car slow down?

- A
- B
- C
- D
- E
- This answer cannot be solved using the graph
- Don’t know

The answer is *D* and *E*
  

]




#physics-problem(number: 4)[
The largest braking acceleration for a car on a dry road is 8 m/s 2. Two cars are driving towards
each other with 88 km/h and the drivers brakes when they are 85 m apart

- Will the two cars crash?
- In case the cars crash, what are the relative velocity of the cars in the crash?
- In case the cars do not crash, how far are they apart when they come to a stop?
- Sketch the distance as a function of time for both cars in the same coordinate system 

#note-box[
  $
  v &= v_0 + a t \ 
  v^2 &= v_0^2 + 2 a s \
  s &= v_0 t + 1/2 a t^2 
  $

  Convert from km/h to m/s
]


#solution[
  1. 

  First I convert $88 "km"/h$ to $m/s$. This is trivialliy done by

  $
    88 "km"/"h" dot 1000 &= (#(88*1000) "km"/"h")/(3600 "s") \ 
    &= #calc.round(88000/3600, digits: 2) "m"/"s"
  $


  We find the distance formula to be


  $
  d = (v^2)/(2 a)
  $


  We input the relevant information
  

  $
  d = ((24.44 "m"/"s"^2)^2)/(2 (8 "m"/"s"^2 )) = (#calc.round(calc.pow(24.44, 2), digits: 2) "m"/"s"^2 )/(#(2 * 8) "m"/"s"^2 ) = #calc.round(597.31/16, digits: 2) "m" 
  $

  Since there are two cars we must multiply the stopping distance by two

  $
  #(37.33 * 2) "m"
  $

  This is the total stopping distance of the two cars, remember that the cars were 85 meters apart. This gives them a leeway of $#calc.round(85-74.66, digits: 2)$ meters. And therefore the cars wont drive into eachother.

#figure(
      cetz.canvas(
        {
          import cetz.draw: *
          import cetz-plot: *

          // Calculate stopping time: t = v/a = 24.44/8 = 3.055 s
          let v0 = 24.44 // m/s
          let a = 8 // m/s²
          let t_stop = v0 / a // 3.055 s

          // Car 1 starts at position 0, moves right (positive direction)
          // Position: x₁(t) = v₀t - (1/2)at²
          let car1(t) = {
            if t <= t_stop {
              v0 * t - 0.5 * a * t * t
            } else {
              v0 * t_stop - 0.5 * a * t_stop * t_stop // stays at stopping position
            }
          }

          // Car 2 starts at position 85m, moves left (negative direction)
          // Position: x₂(t) = 85 - (v₀t - (1/2)at²)
          let car2(t) = {
            if t <= t_stop {
              85 - (v0 * t - 0.5 * a * t * t)
            } else {
              85 - (v0 * t_stop - 0.5 * a * t_stop * t_stop) // stays at stopping position
            }
          }

          plot.plot(
            size: (10, 6),
            x-label: [Time $(s)$],
            y-label: [Position $(m)$],
            x-tick-step: 0.5,
            y-tick-step: 10,
            x-min: 0,
            x-max: 4,
            y-min: 0,
            y-max: 90,
            {
              plot.add(
                domain: (0, 4),
                samples: 100,
                car1,
                style: (stroke: blue + 1.5pt),
                label: [Car 1],
              )
              plot.add(
                domain: (0, 4),
                samples: 100,
                car2,
                style: (stroke: red + 1.5pt),
                label: [Car 2],
              )
            },
          )
        },
      ),
      caption: [Position vs. time for two cars braking: Car 1 (blue) starting at 0m and Car 2 (red) starting at 85m, both decelerating at 8 m/s² from initial velocity 24.44 m/s]
    ) <fig:cars-braking>
            },
          )
        },
      ),
    )


]

]

#physics-problem(number: 5)[
Two identical cars are driving towards each other with a speed of 50.0 km/h. When there is 100 meters between, each car brakes with a constant acceleration of 5.00 m/s 2.
Which of the following statements are correct

- They stop when they are 17.6 meters from each other
- They stop when they are 61.4 meters from each other.
- They stop when they are 80.7 meters from each other.
- They stop just in front of each other.
- They crash after 1.06 seconds.
- They crash after 18.9 seconds.
- They stand still after 1.14 seconds
- They stand still after 2.78 seconds
- Don’t know.


#solution[

  Firstly we convert $50.0 "km"/"h"$ to $"m"/"s"$


  $
    #calc.round(50.0*1000/3600, digits: 2) "m"/"s"^2
  $

  We apply the distance formula

  $
  d &= (#calc.round(calc.pow(13.89, 2), digits: 2) "m"/"s"^2)/(#(2 * 5) "m"/"s"^2) 
  \ &= #calc.round(192.93/10, digits: 2) "m"
  $


  multiplying by 2 we get

  $
  #calc.round(19.29 * 2, digits: 2) "m"
  $

  Meaning there is about $approx 60 "m"$ between the cars, therefore they wont crash

]

]

#let convert(num) = {
  calc.round(num * 1000 / 3600, digits: 2 )
}


#physics-problem(number: 6)[

A car is driving on a horizontal straight road with 95 km/h. The driver observes a pedestrian
crossing the road 60 meters in front, and tries to avoid a collision by breaking the car. The driver
has a reaction rate of 1.5 s before he brakes. During braking, the acceleration is 8.0 m
s 2.


When the car reaches the pedestrian
- It has a speed of 0.0 km/h (It just manages to stop)
- It has a speed of 69 km/h
- It has a speed of 93 km/h
- It does not reach the pedestrian
- Don’t know

#let stopping_distance(v, a) = {
  calc.round(calc.pow(v,2)/(2 * a)  , digits :2)
}

#solution[
  Convert the 95 km/h to m/s


  #let converted = convert(95)

  $
  #converted "m"/"s"^2
  $

  Since the driver reacts after 1.5 seconds that gives the driver a stopping distance of 
  $
    #calc.round(60-26.39*1.5, digits: 2) "m"  
  $



  We then find the velocity of the car by the time it hits the pedestrian

  $
  v^2_f = v^2_i + 2 a d
  $

  #let vforce = calc.round(calc.sqrt(calc.pow(26.39, 2) + 2 * (-8.0) * 20.42), digits: 2)

  $
  v^2_f &= (26.39 "m"/"s")^2 + 2 dot (- 8.0 "m"/"s"^2) dot (20.42)
  \ &= #vforce "m"/"s"^2 <=> 69.23 "km"/"h" 
  $

  Therefore the pedestrian is quite dead
]

]


// https://learn.inside.dtu.dk/d2l/le/lessons/294780/topics/1126046


#physics-problem(number: 7)[
The graph below shows the velocity of a particle in a time interval from $t=0$ s to $t=8$ s.

Which of the following statements are true?
- The position of the particle is greater at t = 8 s compared to t = 0 s
- The particle does not at any point move with a speed greater than 5 m/s
- From t = 0 s to t = 4 s the particle has moved 20 m
- At a given time interval, the particle moves 5 m in negative direction.
- During the motion, the particle has an acceleration of +5 m/s 2 and -5 m/s 2
- Between t = 4 s and t = 5 s the particle is at rest.
- Don’t know
]

