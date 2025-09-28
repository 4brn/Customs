# Design

Student Name: Aleksandar Rangelov
Student Number: 572601

## Table of Contents

1. [[#User Journey]]
	- [[#User Journey Diagram]]
2. [[#Wireframes]]
	- [[#Gameplay Wireframe]]
	- [[#UI Wireframe]]
3. [[#Flow Chart]]
4. [[#Game Functionality]]
5. [[#Game Rules]]


## User Journey

The user journey maps out the user's interaction from launching the game until game completion.

1. Start
	The player opens the game executable, thus starting the game.
2. Introduction
	An introduction to the game story in the form of email correspondence and gameplay instructions.
3. Objective
	The player receives an objective, which has to be completed in order to advance .
4. Gameplay
	- Spawn and move objects
	- Mistake check
		- Making a mistake increases the mistake counter.
	- Objective Completion: 
		- Go to "Overview".
5. Overview
	 - Whether or not the player did the task.
6. Win or Lose Conditions:
	- Win
		- Complete main objective (survive working 5 days)
	- Lose
		- Make more mistakes than the accepted amount, persistent in between levels

### User Journey Diagram

![[User Journey]]

## Wireframes

### Gameplay Wireframe

![[Gameplay Wireframe]]

### UI Wireframe

![[Dialog Wireframe]]

## Flow Chart

![[Flow Chart]]

## Game Functionality

### Core Functionalities:

#### Dialog Screen:
Black screen displaying text, mimicking an email correspondence,
between the player and his employer.

#### Gameplay Mechanics:
- Moving Items:
	- Direction and speed are based on the conveyor belt's direction.

- Drag and Drop:
	- Hovering over an item, clicking and holding the left mouse button allows the player to move and drop any visible item, anywhere in the playing field.

- Players move dangerous items off of the belt into a hole, while letting the safe ones stay on the belt.

- Each mistake (dangerous item passing through or discarding of a safe item) increases mistake counter.

- Each safe item that passes through the end of the belt, adds 1 point gets added towards the objective (daily quota of safe items).

#### UI Updates:

Mistakes counter and objective quota update in real-time

### Game Rules

- Main Objective:
	- Get to the 5th level of the game

- Secondary Objective:
	- Each level has a quota of safe items the player has to pass through

- Item dragging:
	- Player has to remove dangerous items off of the belt before they pass through, and drop them into a hole, properly disposing of it.
	
	- Player can remove any safe or dangerous item.

- Scoring:
	 - The game tracks the number of errors.
	 
	 - Fewer mistakes indicate better performance.

- Winning the Game:
	 - Complete the main objective	

- Losing the Game:
	 - Making too many mistakes

- Restarting:
	 - Players can restart the game but will lose all of their progress.