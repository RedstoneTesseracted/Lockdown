# Lockdown

This repository contains the source for the Lockdown datapack


# Features

Below is a table of all planned features currently (re)implemented

|             Name              | Status |
| ----------------------------- | ------ |
| Redstone wireless transmitter |   ✅   |
| Redstone wireless receiver    |   ✅   |
| Alarm lights                  |   ✅   |
| Force field projector         |   ✅   |
| Keycard reader w/ keycard     |   ✅   |
| Big buttons                   |   ✅   |
| Klaxon block                  |   ✅   |
| Laser projector               |   ✅   |
| Player detector               |   ✅   |
| Mob detector                  |   ✅   |
| Defense turret                |   ✅   |
| Defense drone                 |   ✅   |
| ~~Drone control tower~~       |   ✅   |
| Encoding station              |   ✅   |
| Range upgrade                 |   ✅   |
| Durability upgrade            |   ✅   |
| Flamethrower upgrade          |   ✅   |
| ~~Drone control tower upgrade~~ |   ✅   |
| Laser blaster                 |   ❌   |
| Key                           |   ✅   |
| Air Defense Cannon            |   ❌   |
| Suspicious Thumb Drive        |   ❌   |
| Legacy machine migration      |   ✅   |


## Redstone wireless transmitter

* Transmits a redstone signal to other receivers on the same channel
* Encodable (required)

### History

* Added in R1


## Redstone wireless receiver

* Emits a redstone signal whenever it receives a wireless signal from its channel
* Encodable (required)

### History

* Added in R1


## Alarm lights

* Emits a glowing effect whenever it receives a wireless signal from its channel
* Available in sixteen colors!
* Encodable (required)

### History

* Added in R1


## Force field projector

* Creates an indestructible energy shield when powered by redstone
* Right-click to change size

### History

* Added in R1
* Tweaked force field projector texture in R3
* Force field projectors can now be placed horizontally in R3


## Keycard reader w/ keycard

* Emits a redstone signal whenever a nearby player is holding a keycard with a matching code
* Comes in seventeen colors!
* Encodable (required)

### History

* Added in R1


## Big buttons

* Big fancy buttons!
* Comes in sixteen colors!
* Emits a wireless signal if encoded
* Encodable (optional)

### History

* Added in R1


## Klaxon block

* Makes a noise on loop when powered by redstone
* Right-click to change sound effect

### History

* Added in R1


## Laser projector

* Projects a laser when powered by redstone
* Laser deals damage and can be blocked by solid blocks
* Directional!

### History

* Added in R1


## Player detector

* Emits a redstone signal whenever a player is within five blocks

### History

* Added in R1


## Mob detector

* Emits a redstone signal whenever a non-player mob is within five blocks

### History

* Added in R1


## Defense turret

* Blasts hostile mobs and, optionally, players with a laser
* When given a code, turrets will target players with a non-matching code
* Encodable (optional)

### History

* Added in R1
* Firing range buffed, reload time lowered, and recipe made less expensive in R2
* Added turret upgrades in R2


## Defense drone

* Patrols the area around its home position for any suspicious activity
* When an enemy is detected, drones will enter pursuit and begin firing their laser once in range
* When given a code, drones will target players with a non-matching code
* Encodable (optional)

### History

* Added in R1
* Added drone upgrades in R2


## Drone control tower

* Used to shift the drone's detection area to the position of the tower
* Encodable (required)

### History

* Added in R2
* Removed in R3 due to drone AI overhaul


## Encoding station

* Used to apply codes/channels to items

### History

* Added in R1


## Range upgrade

* Increases firing/detection ranges for drones and turrets
* Right-click on drone/turret to apply
* Maximum of three

### History

* Added in R3


## Durability upgrade

* Increases max health of drones and turrets
* Right-click on drone/turret to apply
* Maximum of three


### History

* Added in R2
* Increased maximum upgrades to 3 in R3


## Flamethrower upgrade

* Causes drones and turrets to shoot fireballs instead of lasers
* Right-click on drone/turret to apply
* Maximum of one

### History

* Added in R2


## Drone control tower upgrade

* Used to pair a drone with the nearest control tower of a matching code
* When applied, the drone will use the tower's position as the center of its search radius
* Right-click on drone to apply
* Maximum of one

### History

* Added in R2
* Removed in R3 due to drone AI overhaul


## Laser blaster

* Pew pew
* Consumes redstone batteries

### History

* Planned for R4


## Redstone Batteries

* Used to fuel the laser blaster

### History

* Planned for R4


## Key

* Brings container locking to survival
* Encodable (required)

### History

* Added in R3


## Air Defense Cannon

* What if laser, but big?

### History

* Planned for R4


## Suspicious thumb drive

* Rare item found in chests?
* When used on a drone or turret, causes said drone/turret to instead target ALL friendly mobs, with priority on players and villagers.

### History

* Planned for R4


## Legacy Wand

* Tool used to drop pre-R3 blocks/items and replace them with their post-R3 counterparts
* Right click to upgrade all items in player inventory
* Right click while facing block to upgrade block
* Upgradeable devices:
    * ✔ Big button
    * ✔ Alarm
    * ✔ Keycard reader
    * ✔ Player detector
    * ✔ Mob detector
    * ✔ Klaxon
    * ✔ Laser projector
    * ✔ Transmitter
    * ✔ Receiver
    * ✔ Force field projector
    * ✔ Control tower
    * ✔ Drone
    * ✔ Turret
    * ✔ Encoder
    * ✔ Crafter
* Upgradeable items:
    * ✔ Big button
    * ✔ Alarm
    * ✔ Keycard reader
    * ✔ Player detector
    * ✔ Mob detector
    * ✔ Klaxon
    * ✔ Laser projector
    * ✔ Transmitter
    * ✔ Receiver
    * ✔ Force field projector
    * ✔ Control tower
    * ✔ Drone
    * ✔ Turret
    * ✔ Encoder
    * ✔ Crafter
    * ✔ Recipe book
    * ✔ Flamethrower upgrade
    * ✔ Durability upgrade
    * ✔ Armor upgrade
    * ✔ Drone control tower upgrade

### History

* Planned for R3


## Removed Features

These features existed prior to the 1.21.4 update due to technical limitations.  However, they are now obsolete:
* Secure crafting table
* Secure recipe book

R3 overhauled drone AI, rendering the following features obsolete:
* Drone control tower
* Drone control tower upgrade


# Test Coverage

A list of all mechanics that should be tested using the [GameTest](https://minecraft.wiki/w/GameTest) system:

|                   Test Name                    | Implemented? |
| ---------------------------------------------- | ------------ |
| Wireless transmitter/receiver                  |      ✅      |
| Block placement                                |      ⚠️      |
| Block placement when obstructed                |      ✅      |
| Block breaking                                 |      ✅      |
| Loot table consistency                         |      ✅      |
| Legacy block upgrading                         |      ❌      |
| Encoding (assign code)                         |      ✅      |
| Encoding (assign channel)                      |      ✅      |
| Force field projector                          |      ✅      |
| Laser projector range                          |      ✅      |
| Laser projector damage                         |      ✅      |
| Keycards & keycard readers                     |      ❓      |
| Keycards & drones                              |      ❓      |
| Keycards & turrets                             |      ❓      |
| Klaxon                                         |      ✅      |
| Wireless alarm lights                          |      ✅      |
| Player detector (ignore mobs, detect players)  |      ✅      |
| Mob detector (ignore technical entities)       |      ✅      |
| Big buttons (clickable, wireless transmission) |      ✅      |
| Range upgrades on drones                       |      ❌      |
| Range upgrades on turrets                      |      ❌      |
| Durability upgrades on drones                  |      ✅      |
| Durability upgrades on turrets                 |      ✅      |
| Flamethrower upgrades on drones                |      ❌      |
| Flamethrower upgrades on turrets               |      ❌      |
| Applying drone/turret upgrades                 |      ❓      |
| Drone targeting and firing                     |      ✅      |
| Drone targeting and firing w/ codes            |      ✅      |
| Drone targeting and firing w/ control towers   |      ✅      |
| Turret targeting and firing                    |      ✅      |
| Turret targeting and firing w/ codes           |      ✅      |
| Chest key                                      |      ❓      |
| Encoder dispensing prevention                  |      ✅      |

> **Note**: Tests marked with "❓" involve a feature that *requires* player interaction.  As such, I'm not yet sure how to implement automated tests for them.

Block placement tests need to exist for the following devices:
* ✔ Keycard reader (❌ multi-directional, ✔ channel)
* ~ Alarm (❌ multi-directional, ✔ channel)
* ~ Big button (❌ multi-directional, ✔ channel)
* ✔ Drone (✔ channel)
* ✔ Player detector
* ✔ Mob detector
* ✔ Klaxon
* ~ Laser projector (❌ multi-directional)
* ✔ Wireless transmitter (✔ channel)
* ✔ Wireless receiver (✔ channel)
* ✔ Force field projector (❌ multi-directional)
* ✔ Turret (multi-directional, ✔ channel)
* ✔ Encoder (✔ inventory)
* ✔ Control tower (✔ channel)

Block obstruction tests need to exist for the following:
* ✔ Keycard reader
    * ✔ Prevent block overlap (allow #minecraft:replaceable)
    * ✔ Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
    * ✔ Requires channel
* ✔ Alarm
    * ✔ Prevent entity overlap (deny #lockdown:blocks_nonsolid_placement)
    * ✔ Requires channel
* ✔ Big button
    * ✔ Prevent entity overlap (deny #lockdown:blocks_nonsolid_placement)
* ✔ Drone
    * ✔ Prevent entity overlap (deny #lockdown:blocks_nonsolid_placement)
* ✔ Player detector
    * ✔ Prevent block overlap (allow #minecraft:replaceable)
    * ✔ Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
* ✔ Mob detector
    * ✔ Prevent block overlap (allow #minecraft:replaceable)
    * ✔ Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
* ✔ Klaxon
    * ✔ Prevent block overlap (allow #minecraft:replaceable)
    * ✔ Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
* ✔ Laser projector
    * ✔ Prevent block overlap (allow #minecraft:replaceable)
    * ✔ Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
* ✔ Wireless transmitter
    * ✔ Prevent block overlap (allow #minecraft:replaceable)
    * ✔ Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
    * ✔ Requires channel
* ✔ Wireless receiver
    * ✔ Prevent block overlap (allow #minecraft:replaceable)
    * ✔ Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
    * ✔ Requires channel
* ✔ Force field projector
    * ✔ Prevent block overlap (allow #minecraft:replaceable)
    * ✔ Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
* ✔ Turret
    * ✔ Prevent entity overlap (deny #lockdown:blocks_nonsolid_placement)
* ✔ Encoder
    * ✔ Prevent block overlap (allow #minecraft:replaceable)
    * ✔ Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
* ❌ Control tower
    * ✔ Prevent block overlap (allow #minecraft:replaceable)
    * ❌ Prevent block overlap one block up (allow #minecraft:replaceable)
    * ✔ Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
    * ✔ Requires channel

Block destruction tests need to exist for the following:
* ✔ Keycard reader (block-based)
* ✔ Alarm (interaction-based)
* ✔ Big button (block-based)
* ✔ Drone (entity-based)
* ✔ Player detector (block-based)
* ✔ Mob detector (block-based)
* ✔ Klaxon (block-based)
* ✔ Laser projector (block-based)
* ✔ Wireless transmitter (block-based)
* ✔ Wireless receiver (block-based)
* ✔ Force field projector (block-based)
* ✔ Turret (entity-based)
* ✔ Encoder (block-based)
* ✔ Control tower (block-based)


Items not covered under the GameTest system:
|                   Test Name                    | Implemented? |
| ---------------------------------------------- | ------------ |
| Static code analysis                           |      ❌      |
| Data pack load errors                          |      ❌      |
| Resource pack load errors                      |      ❌      |
| Advancements                                   |      ❌      |
| Translation key existence checks               |      ✅      |
| JSON text resolution errors                    |      ❓      |

# Known Bugs

* Drone approval carries over from creative to survival mode

# Near-Term TODO:

* Optimize drone AI
* Create wiki
* Either remove control tower or repurpose it
* Redo upgrade textures
* Run game tests
* Port to more versions:
    * 1.21.5
    * 1.21.6
    * 1.21.7
    * 1.21.9
    * 1.21.10
* Set up github workflow to create multi-version data pack

# Future Plans:

* Give drones the option to follow/guard
* Make drones dyeable
* Some way to configure drones
* Laser blaster + redstone energy cells
* Suspicious thumb drive
* Air Defense Cannon

# Version Support

This datapack uses overlays to support multiple versions of the game with a single ZIP file.  However, some features will not be backported to older versions.  Below is a table showing what features are available for each game version.

| Game Version  | Data Pack Version |
| ------------- | ----------------- |
| 1.20-1.20.1   | R2.X              |
| 1.20.2-1.20.6 | ❌               |
| 1.21-1.21.4   | ❌               |
| 1.21.5        | ❌               |
| 1.21.6        | ❌               |
| 1.21.7        | ❌               |
| 1.21.8        | R3                |
| 1.21.9        | ❌               |
| 1.21.10       | ❌               |

