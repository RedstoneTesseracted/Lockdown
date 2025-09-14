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
| Defense drone                 |   ❌   |
| Drone control tower           |   ✅   |
| Encoding station              |   ✅   |
| Range upgrade                 |   ✅   |
| Durability upgrade            |   ✅   |
| Flamethrower upgrade          |   ✅   |
| Drone control tower upgrade   |   ✅   |
| Laser blaster                 |   ❌   |
| Key                           |   ✅   |
| BFG 8000                      |   ❌   |


## Redstone wireless transmitter

* Added in R1
* Transmits a redstone signal to other receivers on the same channel
* Encodable (required)


## Redstone wireless receiver

* Added in R1
* Outputs a redstone signal received from other transmitters on the same channel
* Encodable (required)


## Alarm lights

* Added in R1
* 16 colors
* Flashes when receiving a redstone signal from other transmitters
* Encodable (required)


## Force field projector

* Added in R1
* Creates an indestructible energy shield when powered by redstone
* Right-click to change size


## Keycard reader w/ keycard

* Added in R1
* Encodable (required)


## Big buttons

* Added in R1
* Encodable (optional)


## Klaxon block

* Added in R1


## Laser projector

* Added in R1


## Player detector

* Added in R1


## Mob detector

* Added in R1


## Defense turret

* Added in R1
* Encodable (optional)


## Defense drone

* Added in R1
* Encodable (optional)


## Drone control tower

* Added in R2
* Encodable (required)


## Encoding station

* Added in R1


## Range upgrade

* Added in R1


## Durability upgrade

* Added in R1


## Flamethrower upgrade

* Added in R1


## Drone control tower upgrade

* Added in R1


## Laser blaster

* Planned for R3


## Key

* Planned for R3
* Brings container locking to survival
* Encodable (required)


## The BFG 8000

* Planned for R3


## Removed Features

These features existed prior to the 1.21.4 update due to technical limitations.  However, they are now obsolete:
* Secure crafting table
* Secure recipe book


# Test Coverage

A list of all mechanics that should be tested using the [GameTest](https://minecraft.wiki/w/GameTest) system:

|                   Test Name                    | Implemented? |
| ---------------------------------------------- | ------------ |
| Wireless transmitter/receiver                  |      ✅      |
| Block placement                                |      ⚠️      |
| Block placement when obstructed                |      ❌      |
| Block breaking                                 |      ❌      |
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
| Durability upgrades on drones                  |      ❌      |
| Durability upgrades on turrets                 |      ❌      |
| Flamethrower upgrades on drones                |      ❌      |
| Flamethrower upgrades on turrets               |      ❌      |
| Applying drone/turret upgrades                 |      ❓      |
| Drone targeting and firing                     |      ❌      |
| Drone targeting and firing w/ control towers   |      ❌      |
| Turret targeting and firing                    |      ❌      |
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
* Keycard reader
    * Prevent block overlap (allow #minecraft:replaceable)
    * Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
    * Requires channel
* Alarm
    * Prevent entity overlap (deny #lockdown:blocks_nonsolid_placement)
    * Requires channel
* Big button
    * Prevent entity overlap (deny #lockdown:blocks_nonsolid_placement)
* Drone
    * Prevent entity overlap (deny #lockdown:blocks_nonsolid_placement)
* Player detector
    * Prevent block overlap (allow #minecraft:replaceable)
    * Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
* Mob detector
    * Prevent block overlap (allow #minecraft:replaceable)
    * Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
* Klaxon
    * Prevent block overlap (allow #minecraft:replaceable)
    * Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
* Laser projector
    * Prevent block overlap (allow #minecraft:replaceable)
    * Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
* Wireless transmitter
    * Prevent block overlap (allow #minecraft:replaceable)
    * Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
    * Requires channel
* Wireless receiver
    * Prevent block overlap (allow #minecraft:replaceable)
    * Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
    * Requires channel
* Force field projector
    * Prevent block overlap (allow #minecraft:replaceable)
    * Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
* Turret
    * Prevent entity overlap (deny #lockdown:blocks_nonsolid_placement)
* Encoder
    * Prevent block overlap (allow #minecraft:replaceable)
    * Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
* Control tower
    * Prevent block overlap (allow #minecraft:replaceable)
    * Prevent block overlap one block up (allow #minecraft:replaceable)
    * Prevent entity overlap (allow #lockdown:strict_placement_nonblocking)
    * Requires channel


Tests not covered under the GameTest system:
|                   Test Name                    | Implemented? |
| ---------------------------------------------- | ------------ |
| Static code analysis                           |      ❌      |
| Data pack load errors                          |      ❌      |
| Resource pack load errors                      |      ❌      |
| Translation key existence checks               |      ✅      |
| JSON text resolution errors                    |      ❓      |



# Known Bugs

* Devices broken due to invalid placement lose their assigned channel
* Certain devices could feasibly be placed in the same position twice if done so on the same tick
