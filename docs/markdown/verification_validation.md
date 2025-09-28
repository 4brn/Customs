# Verification and Validation

**Student Name**: Aleksandar Rangelov
**Student Number**: 572601 

## Table of Contents

1. [[#Verification]]
2. [[#Validation]]
3. [[#Improvement Proposal]]
4. [[#Conclusion]]

## Verification

- The executable launches a native GUI with the start menu of the game.
- Text instructions for the game render correctly
- Proper rendering of the game screen
- Random initialization of conveyor belt direction
- Random spawning and safety type of items
- Working item drag and drop functionality
- Items stop when dropped on the ground, move then on belts, and explode when dropped in the hole
- Time stop ability working as intended
- Quota and Mistakes counter work correctly
- Proper handling of main objective completion or game loss

> Conclusion: The code works and produces correct results as the intended design logic.

## Validation

Requirements Check:
1. Change difficulty on objective completion
	- The game properly switches belt count, movement speed, and spawn rate based on level.

2. Ability to move items and stop time
	- Full capability to move, store and discard of any item.

3. Objective score tracking and error count
	- Objective quota is tracked as intended.
	- Mistake counter persists between levels, working as designed.

4. Proper win/lose condition
	- Correct game completion when all levels are passed.
	- Game ends if player makes more mistakes than the acceptable amount, before passing all levels.

5. Cross Platform Support
	- The Game has a compiled executable for every mainstream operating system (Linux, Windows, MacOS, RasberryOS).
	- In addition, game can be played in the browser, eliminating the need for a specific operating system. 

> Conclusion: The game meets all requirements and behaves as intended.

## Improvement

- Better user experience
 
- Better user interface
	- A more responsive and user-friendly interface will elevate the user experience.

- Controller Support:
	- Controller support will double the reach of the game ensuring it can be played from all modern factors (mobile, console, PC).

- More Replayability:
	- Addition of more levels and an endless mode will make the game more replayable.

- More Assets:
	- More sprite assets will make the repetitive gameplay more visually appealing.

- More Music Variety

- Persisting Highscore:
	- Creating a save file with all of the player progress and highscore will encourage players to continue playing instead of starting all over when rebooting the game.

## Conclusion

Using verification and validation, the Conveyor Belt Game was shown to:

- Implement the intended logic well (verification).
- Meet requirements and intended purpose of simulating a stressing work environment in a unstable work market.
