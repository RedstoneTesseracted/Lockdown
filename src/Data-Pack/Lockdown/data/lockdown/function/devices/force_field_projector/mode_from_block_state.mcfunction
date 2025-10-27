# This function converts the note block's pitch number into an integer
# usable by functions/scoreboards.
# It is run BY and AT the force field root entity

execute if block ~ ~ ~ minecraft:note_block[note=0] run return 0
execute if block ~ ~ ~ minecraft:note_block[note=1] run return 1
execute if block ~ ~ ~ minecraft:note_block[note=2] run return 2
execute if block ~ ~ ~ minecraft:note_block[note=3] run return 3
execute if block ~ ~ ~ minecraft:note_block[note=4] run return 4
execute if block ~ ~ ~ minecraft:note_block[note=5] run return 5
execute if block ~ ~ ~ minecraft:note_block[note=6] run return 6
execute if block ~ ~ ~ minecraft:note_block[note=7] run return 7
execute if block ~ ~ ~ minecraft:note_block[note=8] run return 8
execute if block ~ ~ ~ minecraft:note_block[note=9] run return 9
execute if block ~ ~ ~ minecraft:note_block[note=10] run return 10
execute if block ~ ~ ~ minecraft:note_block[note=11] run return 11
execute if block ~ ~ ~ minecraft:note_block[note=12] run return 12
execute if block ~ ~ ~ minecraft:note_block[note=13] run return 13
execute if block ~ ~ ~ minecraft:note_block[note=14] run return 14
execute if block ~ ~ ~ minecraft:note_block[note=15] run return 15
execute if block ~ ~ ~ minecraft:note_block[note=16] run return 16
execute if block ~ ~ ~ minecraft:note_block[note=17] run return 17
execute if block ~ ~ ~ minecraft:note_block[note=18] run return 18
execute if block ~ ~ ~ minecraft:note_block[note=19] run return 19
execute if block ~ ~ ~ minecraft:note_block[note=20] run return 20
execute if block ~ ~ ~ minecraft:note_block[note=21] run return 21
execute if block ~ ~ ~ minecraft:note_block[note=22] run return 22
execute if block ~ ~ ~ minecraft:note_block[note=23] run return 23
execute if block ~ ~ ~ minecraft:note_block[note=24] run return 24

# This should never happen
return fail
