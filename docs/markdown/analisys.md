# Analysis

**Name**: Aleksandar Rangelov
**Student Number**: 572601 

## Table of Content

1. [[#Description]]
2. [[#Requirements]]
3. [[#Game Engines]]
	- [[#PICO-8]]
	- [[#Unity]]
	- [[#Godot]]
4. [[#Conclusion]]

## Description

You play as an new employee in a big company.

> Main objective:
	> Survive one working week in the company (5 days) (Monday to Friday).

Tasks:
- Oversee a subsection of a conveyor belt line.
- Remove dangerous items of the belt.
- Let safe ones pass through.

Game Loop:
- Each day of the week gets exponentially harder.

Special Ability:
- Time stops when moving an item.

## Requirements

A simple game.

## Game Engines

### PICO-8

PICO-8 [^1] is an 8 bit console emulation with a full fledged game development tool set. It features a coding environment, sprite creation, tile-map creation, audio and sound creation tools baked into the console, making for a compact portable development environment.	

| Specification | Limit                 |
| ------------- | --------------------- |
| Display       | 128x128               |
| Colors        | 16                    |
| Memory        | 32kb                  |
| Sound         | 4 channels            |
| Language      | Lua [^2]              |
| Sprites       | 256                   |
| Sprite Size   | 8x8, 16x16            |
| Compatibility | Windows, MacOS, Linux |

The harsh hardware limitations of PICO-8 are carefully chosen to be fun to work with, to encourage small but expressive designs, and to give games made with PICO-8 their own particular look and feel. The cross compatibility and small size of the game would allow it to be played on any device.

### Unity

Unity [^3] the most popular gaming engine that developers use nowadays. Its versatility, practicality and asset collection make it a very good choice for  the implementation of the project. However, the time to learn and extensive library of tools don't match the project requirements for a simple game and limits time put towards learning outcomes.

### Godot

Godot [^4] is a open-source game engine made with ease of use and developer experience in mind. Godot is cross platform, allowing for the game to be played on practically every device. It uses its own language (gdscript [^5]) for program logic.

Although better suited for the project task and learning outcomes than Unity it still has some learning requirements in order to create a game.

## Conclusion

Taking the game engine comparison research into consideration, PICO-8 will be game engine used for developing the game. Although the other options are also viable, they require some learning which limits time put into learning goals, where as PICO-8 is a simpler engine. Moreover, the hardware limitations also limit the scope of the project while still allowing for active and iterative development, while following the requirement for a simple game - a simple engine is a better choice for a simple game.

[^1]: PICO-8 https://www.lexaloffle.com/pico-8.php
[^2]: Lua https://www.lua.org/about.html
[^3]: Unity https://en.wikipedia.org/wiki/Unity_(game_engine)
[^4]: Godot  https://godotengine.org/features/
[^5]: Gdscript https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html
