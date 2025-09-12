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
| Block placement                                |      ❌      |
| Block breaking                                 |      ❌      |
| Loot table consistency                         |      ❌      |
| Legacy block upgrading                         |      ❌      |
| Encoding (assign code)                         |      ✅      |
| Encoding (assign channel)                      |      ✅      |
| Force field projector                          |      ✅      |
| Laser projector range                          |      ✅      |
| Laser projector damage                         |      ❌      |
| Keycards & keycard readers                     |      ❌      |
| Keycards & drones                              |      ❌      |
| Keycards & turrets                             |      ❌      |
| Klaxon                                         |      ❌      |
| Wireless alarm lights                          |      ❌      |
| Player detector (ignore mobs, detect players)  |      ✅      |
| Mob detector (ignore technical entities)       |      ✅      |
| Big buttons (clickable, wireless transmission) |      ❌      |
| Range upgrades on drones                       |      ❌      |
| Range upgrades on turrets                      |      ❌      |
| Durability upgrades on drones                  |      ❌      |
| Durability upgrades on turrets                 |      ❌      |
| Flamethrower upgrades on drones                |      ❌      |
| Flamethrower upgrades on turrets               |      ❌      |
| Laser projectile motion                        |      ❌      |
| Applying drone control tower upgrade           |      ❌      |
| Drone targeting and firing                     |      ❌      |
| Turret targeting and firing                    |      ❌      |
| Chest key                                      |      ❌      |
| Encoder dispensing prevention                  |      ❌      |


Tests not covered under the GameTest system:
|                   Test Name                    | Implemented? |
| ---------------------------------------------- | ------------ |
| Static code analysis                           |      ❌      |
| Data pack load errors                          |      ❌      |
| Resource pack load errors                      |      ❌      |
| JSON text resolution errors                    |      ❌      |

