tag @s remove ld_alarmed
scoreboard players set @s ld_time 39
execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @s ArmorItems[3].tag.LockdownData.block_model
stopsound @a[distance=..20] block minecraft:alarm
stopsound @a[distance=..20] block minecraft:alarm2
stopsound @a[distance=..20] block minecraft:entity.elder_guardian.curse
stopsound @a[distance=..20] block minecraft:entity.guardian.death
stopsound @a[distance=..20] block minecraft:block.bell.use
