# Analysis

![banner](https://w.wallhaven.cc/full/57/wallhaven-57l235.png)

**Name**: Aleksandar Rangelov \
**Student Number**: 572601 \
**Class**: STA-EN10

## Table of Content

- [[#Project Description]]
- [[#Requirements]]
- [[#Scope]]
- [[#Stakeholders]]
- [[#Game Engines]]
	- [[#PICO-8]]
	- [[#Unity]]
	- [[#Godot]]
- [[#Conclusion]]

## Project Description

The game takes place exactly after a checked luggage gets put on a conveyor belt  disappears outside of the passenger's vision. You play as an airport customs employee, tasked with overseeing and discarding  suspicious, dangerous or unsafe luggage moving onto the conveyor belts towards their next destination. The player needs to quickly remove of such luggage by dragging and dropping them into discarding chambers (discarding with fire or controlled explosion), before they go into the next room. The conveyor gradually begin to move faster, scaling the gameplay difficulty. In the unfortunate event of a prohibited item passing, the player looses points and eventually his job. The game ends with the player being fired.

## Requirements
- A simple game

## Scope

![[MosCoW]]

## Stakeholders

![[PI Matrix]]

## Game Engines

### PICO-8

PICO-8 [^1] is an 8 bit console emulation with a full fledged game development toolset. It features a coding environment, sprite creation, tile-map creation, audio and sound creation tools baked into the console, making for a compact portable development environment.	

| Specification | Limit                 |
| ------------- | --------------------- |
| Display       | 128x128               |
| Colors        | 16                    |
| Memory        | 32kb                  |
| Sound         | 4 channels            |
| Code          | Lua [^2]              |
| Sprites       | 256                   |
| Sprite Size   | 8x8                   |
| Map Size      | 128x32 tiles          |
| Compatibility | Windows, MacOS, Linux |

The harsh hardware limitations of PICO-8 are carefully chosen to be fun to work with, to encourage small but expressive designs, and to give games made with PICO-8 their own particular look and feel. The cross compatibility and small size of the game would allow it to be played on any device.  

### Unity

Unity [^3] the most popular gaming engine that developers use nowadays. Its versatility, practicality and asset collection make it a very good choice for  the implementation of the project. However, the time to learn and extensive library of tools don't match the project requirements for a simple game and limits time put towards learning outcomes.

### Godot

Godot [^4] is a open-source game engine made with ease of use and developer experience in mind. Godot is cross platform, allowing for the game to be played on practically every device. It uses its own language (gdscript [^5]) for program logic.

Although better suited for the project task and learning outcomes than Unity it still has some learning requirements in order to create a game.

## Conclusion

Taking the game engine comparison research into consideration, PICO-8 should be game engine used for developing the game. Although the other options are also viable, they require some learning which limits time put into learning goals, where as PICO-8 is a simpler engine. Moreover, the hardware limitations also limit the scope of the project while still allowing for active and meaningful development, while following the requirement for a simple game - a simple engine is a better choice for a simple game.

[^1]: PICO-8 https://www.lexaloffle.com/pico-8.php
[^2]: Lua https://www.lua.org/about.html
[^3]: Unity https://en.wikipedia.org/wiki/Unity_(game_engine)
[^4]:  Godot  https://godotengine.org/features/
[^5]: Gdscript reference  https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html
