# Realise

**Student Name**: Aleksandar Rangelov
**Student Number**: 572601 

## Table of Contents

1. [[#Introduction]]
2. [[#Development Environment]]
3. [[#System Specification]]
4. [[#File Structure]]
5. [[#Main File]]
6. [[#Functionality]]
	- [[#Spawning of Items]]
7. [[#Screenshots]]
8. [[#Installation]]
## Introduction

This document will describe the installation, code structure, realization and key functionality of the game. The game is developed using the Pico-8 game engine.

## Development Environment

- Programming Language: Lua
- Game Engine: Pico-8
- IDE: Zed, Neovim

## System Specification

- Operating System: Windows, Linux or MacOS
- Memory: 1GB
- Disk Space: < 3MB
- Resolution: 128x128
- Input: Mouse Only

OR

- A Browser

## File Structure

```
.
├── docs/ <-- the document you reading is here
├── index.html (web player)
├── job.js (web player)
└── src/
    ├── area.lua
    ├── belt.lua
    ├── color.lua
    ├── debug.lua
    ├── difficulty.lua
    ├── explosion.lua
    ├── game.lua
    ├── item.lua
    ├── main.lua (game loop)
    ├── menu.lua
    ├── mouse.lua	
    └── job.p8 (main file, used by Pico-8)
```

### Main File
```
-- job.p8

-- state machine
#include main.lua

-- objectives
#include difficulty.lua

-- States
#include menu.lua
#include game.lua

-- input
#include mouse.lua

-- logic
#include belt.lua
#include item.lua
#include area.lua
#include explosion.lua
#include color.lua
#include debug.lua

-- enable mouse and keyboard input
poke(0x5f2d, 0x1, 0x2, 0x4)
```

## Functionality

### Spawning of Items

```lua
function add_item()
    local item = {}
    local belt = rnd(belts)
    
    local safe =  flr(rnd(2)) + 1 == 1
    local sprite = safe
        and SAFE_SPRITES[flr(rnd(#SAFE_SPRITES)) + 1]
        or DANGEROUS_SPRITES[flr(rnd(#DANGEROUS_SPRITES)) + 1]
    
    item.id = id_counter
    item.x = belt.flipped and 112 or 0
    item.y = belt.y - 3 + flr(rnd(3))
    item.dx = 0
    item.safe = safe
    item.sprite = sprite
    
    add(items, item)
	
    id_counter = id_counter + 1
end
```

## Screenshots

### Dialog

![[dialog.png]]

#### Gameplay

![[gameplay.png]]

## Installation

-  [Play](https://4brn.github.io/job/) in the browser.
- Download the executable or source code from [here](https://github.com/4brn/job/releases).
