# This function shows information about the Lockdown data pack

# Show text
tellraw @s {translate: "lockdown.info.header", fallback: "Lockdown Pack Information:", color: "aqua", underlined: true, bold: false}
tellraw @s ""
tellraw @s {translate: "lockdown.info.resource_pack", fallback: "Resource Pack: %s", color: "green", with: [{translate: "lockdown.info.resource_pack.enabled", fallback: "Disabled", color: "aqua"}]}
tellraw @s {translate: "lockdown.info.version", color: "green", with: [{text: "R3", color: "aqua"}]}
tellraw @s {translate: "lockdown.info.version_number", color: "green", with: [{score: {name: "lockdown.pack_version", objective: "lockdown.constant"}, color: "aqua"}]}

# Reset trigger
scoreboard players reset @s lockdown.show_info
scoreboard players enable @s lockdown.show_info
advancement revoke @s only lockdown:hidden/show_info
