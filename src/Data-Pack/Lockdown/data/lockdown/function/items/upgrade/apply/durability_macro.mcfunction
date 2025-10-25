# Runs the function macro in lockdown:items/upgrade/apply/__durability_macro
# This exists purely for the sake of warning for any errors in the function macro
# that would cause it to fail to compile

execute store result score lockdown.macro_status lockdown.local run function lockdown:items/upgrade/apply/__durability_macro with storage lockdown:temp args
execute unless score lockdown.macro_status lockdown.local matches 1 run tellraw @p {translate: "lockdown.messages.bug.macro.generic", color:"red", with: [{text: "lockdown:items/upgrade/apply/__durability_macro", color:"gray", underlined: true}]}
