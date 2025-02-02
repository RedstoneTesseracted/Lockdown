# Updates all potential receivers within a 50 block radius
execute as @e[tag=lockdown.channel.receiver,distance=..50] at @s run function lockdown:channels/update
