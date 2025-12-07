# Lockdown

This repository contains the source for the Lockdown datapack

![Preview](images/Preview.png)



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
| Flamethrower upgrades on turrets               |      ✅      |
| Applying drone/turret upgrades                 |      ❓      |
| Drone targeting and firing                     |      ✅      |
| Drone targeting and firing w/ codes            |      ✅      |
| Turret targeting and firing                    |      ✅      |
| Turret targeting and firing w/ codes           |      ✅      |
| Chest key                                      |      ❓      |
| Encoder dispensing prevention                  |      ✅      |

> **Note**: Tests marked with "❓" involve a feature that *requires* player interaction.  As such, I'm not yet sure how to implement automated tests for them.


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

This datapack uses overlays to support versions 1.21.5-1.21.10.

## Older Versions

Old 1.16, 1.17, and 1.20.1 versions are available on the project's GitHub page [here](https://github.com/RedstoneTesseracted/Lockdown/releases)


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
