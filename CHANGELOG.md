# Release 3

## Changes

* Updated to 1.21.5-1.21.10
* Complete rewrite of the data pack
* Completely overhauled drones
    * Rewrote drone AI
    * New drone model
    * New sound effects
    * Drone lasers now have a custom model
    * Tweaked recipe
* Improvements to turrets:
    * Turrets now rotate around two axes of rotation
    * Turrets can now be placed on any side of a block
    * Turret lasers now have a custom model
    * New sound effects
    * Reduced recipe cost to be more in line with that of drones
* Improvements to force field projector:
    * Tweaked texture to show directionality
    * Can now be placed in any direction
    * Added brief shield raising/lowering animation
* Improvements to laser projectors
    * Greatly increased range of laser projectors
    * Laser projectors can now be blocked by solid blocks
    * Laser projectors can now be placed vertically
* Removed drone control tower and drone control tower upgrade, as they are now obsolete.  Use the legacy wand to return materials
* Changes to upgrades:
    * Upgrades are no longer mutually exclusive on drones/turrets
    * Durability upgrade can now be stacked up to 3
    * Added turret/drone range upgrade (can be stacked up to 3)
    * Added new textures for upgrades
    * Flamethrower upgrade now causes drones/turrets to shoot fireballs, instead of lighting the ground underneath their targets on fire.
* Added container key
    * Brings container locking to survival
* Keycards now come in sixteen new colors
* Tweaked base keycard recipe to be slightly simpler
* Changes to keycard readers:
    * Keycard readers are now full blocks
    * Now emit a redstone signal when they detect a valid keycard
    * Changed recipe to require fewer types of materials
* Adding a code to big buttons is now optional
* Changed klaxon recipe to require fewer types of materials
* Tweaked mob detector recipe to allow more item substitutes
* Added new alarm sounds to the klaxon
* All recipes now use the crafting table, now that vanilla supports custom components in recipe outputs
* Removed the secure crafter and secure recipe book, as they are no longer needed.  Use the legacy wand to return materials
* Text now uses translation keys instead of being hardcoded

## Migrating Legacy Machines to Release 3

* Added legacy wand for updating old blocks/items to their R3 equivalent
* Right-click wand to update all legacy items in your inventory, as well as whatever legacy device you're looking at


# Release 2.1

* Updated to 1.20


# Release 2

## Changes

* Updated datapack to 1.17!
    * Note: release 2 is not backwards compatible with 1.16
* Added drone control tower
* Entity detector no longer detects players
* Added drone/turret upgrades:
    * Control tower upgrade (drone only)
    * Durability upgrade
    * Flamethrower upgrade
* Buffed turrets slightly:
    * Increased firing range from ten to fifteen blocks
    * Decreased reload time from 2 to 1.5 seconds
    * Tweaked recipe to be slightly less expensive

## Bug Fixes
* Fixed bug where unencoded drones would target the player anyways until reaching firing range.
* Fixed bug where the keycard reader triggered if an out-of-range player held a matching keycard while an unauthorized player stood in-range.
* Fixed bug where devices would receive a wireless signal from an out-of-range transmitter if a different (unpowered) transmitter was closer.
* Fixed bug where player detector could detect players in spectator mode
* Fixed bug where the recipe book did not function properly in multiplayer
* Fixed bug where the encoder and crafter didn't work if another player (besides the one using it) was nearby. 


# Release 1.2

* Fixed a bug where the recipe book disappeared on use in survival. 


# Release 1.1

* Fixed a bug where the blocks/devices weren't placeable in survival. 


# Release 1

* Initial release
