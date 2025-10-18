$execute if entity @e[nbt={UUID: $(origin)}] run damage @s $(damage) $(type) by @n[nbt={UUID: $(origin)}]
$execute unless entity @e[nbt={UUID: $(origin)}] run damage @s $(damage) $(type)
return 1
