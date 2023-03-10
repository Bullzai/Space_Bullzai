/* Reflection

Name : Vidmantas Valskis
Student Number: 20099690

Part A1 - Mark (1/1)
-----------------------------
Inclusion of completed Readme


Part A2 - Mark (5/5)
-----------------------------
Line numbers and examples 
provided for everything, with 
marks and commentary


Part A3 - Mark (5/5)
-----------------------------
Video shorter than 10 mins
included explaining the code
and key elements of the game.

https://youtu.be/s4X-KfHTrqI


Part B1 - Mark (1/1)
-----------------------------
Use of // comments 
and multineline comments.

GamePlay class, lines 21 to 23 - single line comments
GamePlay class, lines 1 to 4 - multiline comments


Part B2 - Mark (1/1)
-----------------------------
Auto-formatted all files.


Part B3 - Mark (1/1)
-----------------------------
Meaningful names of variables and methods,
use of camelCase.


Part B4 - Mark (1/1)
-----------------------------
Main program, multiple Class files,
readme & reflection.


Part C - Mark (5/5)
-----------------------------
Use of standard programming control 
constructs (if, loop, nesting).

Nesting:
Assignment2_20099690_Vidmantas_Valskis, line 15-16 is a nested if statement inside an else statement.
Assignment2_20099690_Vidmantas_Valskis, line 50-51 is a nested if statement inside an else if statement.
GamePlay, line 52 is a for each loop nested inside another for each loop on line 36.

If:
GamePlay, line 41 is an if statement.
GamePlay, line 45 is an if statement.

Loops:
Interface, lines 15-18 is a do loop.
Interface, lines 48-61 is a do loop.
Assignment2_20099690_Vidmantas_Valskis, lines 79-81 is a while loop.
Assignment2_20099690_Vidmantas_Valskis, lines 84-87 is a while loop.
GamePlay, lines 15-17 is a for loop.
GamePlay, lines 26-33 is a for loop.
GamePlay, lines 36-66 is a for each loop.
GamePlay, lines 52-65 is a for each loop.


Part D1 - Mark (9/10)
-----------------------------
Working game 

The game has scoring, lives,
rounds, high scores,
new tournament (press key 'r') and new game (match)
reset after the tournament is over.


Part D2 - Mark (10/10)
-----------------------------
Handling key events 

To move left press: a or LEFT ARROW
To move left 50% faster press: A (shift + a or just use CapsLock)
To move right press: d or RIGHT ARROW
To move right 50% faster press: D (shift + d or just use CapsLock)
To shoot press: w or UP ARROW
To shoot 50% slower press: W (shift + w or just use CapsLock)
To start a new tournament press: r
To stop the current tournament and exit press: ESC

Assignment2_20099690_Vidmantas_Valskis, lines 41-74 shows the code for key handling.


Part D3 - Mark (10/10)
-----------------------------
Collision detection / avoidance

collision detection with 25~ (by default)
objects. Player ship bullets (6x) collision
detection against 20 (by default) moving
enemy ship objects.

GamePlay, lines 154-162 has a collision detection code for rectangle (for e.g. bullet) vs rectangle (for e.g. enemy ship)


Part E1 - Mark (10/10)
-----------------------------
I created a new class (GamePlay) to keep the main program (Assignment2_20099690_Vidmantas_Valskis) as clean as possible.
GamePlay class holds all the information & data.
It has the most important methods and game mechanics with calculations in it.
The Player class was not copied from Pong Game and is different.

Bullet class:
lines 4-9 contains fields
lines 11-17 contains constructor
lines 19-25 contains overloaded constructor
lines 46-68 contains getters 
lines 71-101 contains setters

Button class:
lines 4-9 contains fields
lines 11-16 contains constructor
lines 18-23 contains overloaded constructor
lines 31-49 contains getters 
lines 52-70 contains setters

Enemy class:
lines 4-10 contains fields
lines 12-18 contains constructor
lines 20-26 contains overloaded constructor
lines 63-85 contains getters 
lines 88-122 contains setters

GamePlay class:
lines 7-12 contains fields
lines 14-18 contains constructor
it has no overloaded constructor
lines 176-182 contains getters 
lines 185-191 contains setters

Interface class:
lines 4-6 contains fields
lines 8-10 contains constructor
lines 12-19 contains overloaded constructor
lines 65-67 contains getters 
lines 70-72 contains setters

Player class:
lines 4-10 contains fields
lines 12-14 contains constructor
lines 16-19 contains overloaded constructor
lines 34-60 contains getters 
lines 63-97 contains setters

Ship class:
lines 4-8 contains fields
lines 10-15 contains constructor
lines 17-23 contains overloaded constructor
lines 68-82 contains getters 
lines 85-107 contains setters


Part E2 - Mark (10/10)
-----------------------------
Class bespoke methods.

no return value methods:
Bullet, lines 27-29 has a no return value method.
Bullet, lines 32-36 has a no return value method.
Bullet, lines 39-43 has a no return value method.

accepting parameters methods:
Ship, lines 26-34 has an accepting parameters method.
Ship, lines 58-60 has an accepting parameters method.
GamePlay, lines 129-151 has an accepting parameters method.

returning values methods:
Ship, lines 36-41 has returning value method.
Ship, lines 43-48 has returning value method.
GamePlay, lines 154-162 has returning value method

overloading methods:
Ship, lines 63-65 has an overloaded method.
GamePlay, lines 165-173 has an overloaded method.


Part E3 - Mark (10/10)
-----------------------------
Classes are used in an appropriate manner,
respecting encapsulation rules.

Declaration:
Assignment2_20099690_Vidmantas_Valskis, line 4
Enemy, line 10

Initialisation:
Assignment2_20099690_Vidmantas_Valskis, line 8
Enemy, line 29

Calling the getters & setters:
Assignment2_20099690_Vidmantas_Valskis, line 13 calls a getter.
Assignment2_20099690_Vidmantas_Valskis, line 25 calls a getter.
Assignment2_20099690_Vidmantas_Valskis, line 26 calls a setter.
Assignment2_20099690_Vidmantas_Valskis, line 80 calls a setter.

Calling an overloaded constructor:
Interface, line 16 calls an overloaded constructor.
Ship, line 59 calls an overloaded constructor.
Ship, line 64 calls an overloaded constructor.
GamePlay, line 16 calls an overloaded constructor.


Part F1 - Mark (10/10)
-----------------------------
Use of arrays

GamePlay, line 7 has an array size that is specified by some user input.
Player, line 9 is a value filled by user input.

Array examples:
Interface, line 6 creates an array of objects.
Ship, line 8 creates an array of objects.


Part F2 - Mark (10/10)
-----------------------------
Calculations performed on the information stored

Elements in the array is checked as part of a 
loop using .length. Each value is compared to 
some criteria and the value of an array element is 
updated:
GamePlay, lines 26-33
GamePlay, lines 71-80

Even more complex checks and calculations (including collisions):
GamePlay, lines 36-66

TOTAL MARK - 99

*/
