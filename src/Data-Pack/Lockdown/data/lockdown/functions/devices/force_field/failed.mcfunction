title @a[distance=..5] actionbar {"text":"Insufficient Space","color":"red","bold":"true"}
stopsound @a[distance=..15] block minecraft:block.beacon.activate
playsound minecraft:entity.blaze.hurt block @a ~ ~ ~ 0.75 0.0
kill @s[type=armor_stand,tag=ld_field]
