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


# Wiki Pages

* ✔ Wireless transmitter
* ✔ Wireless receiver
* ✔ Alarm lights
* ✔ Force field projector
* ✔ Keycard reader
* ✔ Keycard
* ✔ Big buttons
* ✔ Klaxon block
* ✔ Laser projector
* ✔ Player detector
* ✔ Mob detector
* ✔ Defense turret
* ✔ Defense drone
* ✔ Encoding station
* ✔ Range upgrade
* ✔ Durability upgrade
* ✔ Flamethrower upgrade
* ✔ Key
* ✔ Legacy wand
* ✔ Control tower
* ✔ Control tower upgrade
* ✔ Secure crafting table
* ✔ Secure recipe book
* Channels


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


# Near-Term TODO:

* Optimize drone AI
* Port to more versions:
    * 1.21.5
    * 1.21.6
    * 1.21.7
    * 1.21.9
    * 1.21.10
* Create front-page document
* Set up github workflow to create multi-version data pack
* Auto-generate device-placing functions for use in unit tests
* Make turrets remember approved entities similar to drones?

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


# Credits

This datapack makes use of the following sound effects:

|                           Name                             |    Author    |              Link               |       License      |
| ---------------------------------------------------------- | ------------ | ------------------------------- | ------------------ |
| alarm3.WAV                                                 | phantastonia | https://freesound.org/s/270640/ | Creative Commons 0 |
| Permission Denied.wav                                      | ironcross32  | https://freesound.org/s/582632/ | Creative Commons 0 |
| Beep Bad                                                   | unfa         | https://freesound.org/s/154888/ | Creative Commons 0 |
| blaster shot 8_1(Sytrus,rsmpl,multiprcsng)single.wav       | newlocknew   | https://freesound.org/s/514058/ | Attribution 4.0    |
| blaster shot 11_2(Sytrus,rsmpl,3lrs,multiprcsng)single.wav | newlocknew   | https://freesound.org/s/514050/ | Attribution 4.0    |
| Sci-fi rifle weapon shot_3 (14lrs,mltprcssng).wav          | newlocknew   | https://freesound.org/s/557513/ | Attribution 4.0    |
| Sci-fi rifle weapon shot_2-1 (17lrs,mltprcssng).wav        | newlocknew   | https://freesound.org/s/557514/ | Attribution 4.0    |
