#import "@local/dtu-template:0.6.3": *

#show: dtu-note.with(
  course: "02132",
  course-name: "Computer Systems",
  title: "Lecture 1",
  date: datetime(year: 2026, month: 9, day: 02),
  author: "Rasmus Rosendahl-Kaa (S255955)",
  semester: "2026 Fall",
)
= 2.1
Given _n_ bits, how many distinct combinations of the _n_ bits exist?

$2^n$

= 2.2
There are 26 characters in the alphabet we use for writing English. What is the least number of bits needed to give each character a unique bit pattern? How many bits would we need to distinguish between upper- and lowercase versions of all 26 characters?

given we'd need at least 26 states we can find it via taking $log_2$

$
  log_2(26*2) approx 5.7 = 6
$

Thus we need $2^6$ bits to represent all letter

= 2.5
Using 5 bits to represent each number, write the representations of 7 and- 7 in 1's complement, signed magnitude, and 2's complement integers.

7 in bit digit is

$00111$

Flipping and adding 1 we get -7

$11001$


= 2.6
Write the 6-bit 2's complement representation of -32.


= 2.9
How many bits are needed to represent Avogadro's number (6.02 . 1023)
in 2's complement binary representation?
= 2.10
Convert the following 2's complement binary numbers to decimal.
/ a.: 1010
/ b.: 01011010
/ C.: 11111110
/ d.: 0011100111010011
= 2.11
Convert these decimal numbers to 8-bit 2's complement binary numbers.
/ a.: 102
/ b.: 64
/ c.: 33
/ d.: -128
/ e.: 127
= 2.12
If the last digit of a 2's complement binary number is 0, then the number is even. If the last two digits of a 2's complement binary number are 00 (e.g., the binary number 01100), what does that tell
you about the number?
= 2.14
Add the following bit patterns. Leave your results in binary form.
/ a.: 1011 + 0001
/ b.: 0000 + 1010
/ C.: 1100 + 0011
/ d.: 0101 + 0110
/ e.: 1111 + 0001
= 2.17
Add the following 2's complement binary numbers. Also express the
answer in decimal.
/ a.: 01 + 1011
/ b.: 11 + 01010101
/ C.: 0101 + 110
/ d.: 01 + 10
= 2.20
The following binary numbers are 4‑bit 2’s complement binary numbers. Which of the following operations generate overflow? Justify your answer by translating the operands and results into decimal.
/ a.: 1100 + 0011
/ b.: 1100 + 0100
/ c.: 0111 + 0001
/ d.: 1000 - 0001
/ e.: 0111 + 1001
= 2.25
Why does the sum of a negative 2’s complement number and a positive 2’s complement number never generate an overflow?
= 2.30
Compute the following. Write your results in binary.
/ a.: 01010111 AND 11010111
/ b.: 101 AND 110
/ c.: 11100000 AND 10110100
/ d.: 00011111 AND 10110100
/ e.: (0011 AND 0110) AND 1101
/ f.: 0011 AND (0110 AND 1101)
= 2.33
Compute the following:
/ a.: 01010111 OR 11010111
/ b.: 101 OR 110
/ c.: 11100000 OR 10110100
/ d.: 00011111 OR 10110100
/ e.: (0101 OR 1100) OR 1101
/ f.: 0101 OR (1100 OR 1101)
= 2.34
Compute the following:
/ a.: NOT(1011) OR NOT(1100)
/ b.: NOT(1000 AND (1100 OR 0101))
/ c.: NOT(NOT(1101))
/ d.: (0110 OR 0000) AND 1111
= 2.43
Translate the following ASCII codes into strings of characters by interpreting each group of eight bits as an ASCII character.

/ a.: x48656c6c6f21
/ b.: x68454c4c4f21
/ c.: x436f6d70757465727321
/ d.: x4c432d32
= 2.45
Convert the following unsigned binary numbers to hexadecimal.
/ a.: 1101 0001 1010 1111
/ b.: 001 1111
/ C.: 1
/ d.: 1110 1101 1011 0010
= 2.46
Convert the following hexadecimal numbers to binary.
/ a.: xlO
/ b.: x801
/ C.: XF731
/ d.: xOF1E2D
/ e.: xBCAD
= 2.54

$Q_1 = "NOT"("NOT"(X) "OR" (X "AND" Y "AND" Z))$
$Q_2 = "NOT"((Y "OR" Z) "AND" (X "AND" Y "AND" Z))$

#table(
  columns: 5,
  align: center,
  stroke: none,
  [*X*], [*Y*], [*Z*], [*$Q_1$*], [*$Q_2$*],
  table.hline(),
  table.vline(x: 3),
  [0], [0], [0], [0], [1],
  [], [], [], [], [],
  [], [], [], [], [],
  [], [], [], [], [],
  [], [], [], [], [],
  [], [], [], [], [],
  [], [], [], [], [],
  [], [], [], [], [],
  table.hline(),
)
