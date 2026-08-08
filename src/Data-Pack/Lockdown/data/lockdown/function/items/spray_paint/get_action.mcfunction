# This function sets up a data structure that determines how/what color gets applied based on what the player is doing.
# * A spray can held in the main hand results in the primary color being painted
# * A spray can held in the off hand results in the primary color being painted
# * The main hand takes priority over the off hand

# Main hand gets priority
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=16383998] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [1.0, 1.0, 1.0]}
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=16701501] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [0.996078431372549, 0.8470588235294118, 0.23921568627450981]}
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=1908001] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [0.11372549019607843, 0.11372549019607843, 0.12941176470588237]}
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=3949738] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [0.23529411764705882, 0.26666666666666666, 0.6666666666666666]}
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=8606770] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [0.5137254901960784, 0.32941176470588235, 0.19607843137254902]}
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=1481884] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [0.08627450980392157, 0.611764705882353, 0.611764705882353]}
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=4673362] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [0.2784313725490196, 0.30980392156862746, 0.3215686274509804]}
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=6192150] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [0.3686274509803922, 0.48627450980392156, 0.08627450980392157]}
#execute if items entity @s weapon.mainhand *[minecraft:dyed_color=3847130] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [0.22745098039215686, 0.7019607843137254, 0.8549019607843137]}
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=3847130] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [0.200, 0.604, 0.988]}
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=10329495] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [0.615686274509804, 0.615686274509804, 0.592156862745098]}
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=8439583] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [0.5019607843137255, 0.7803921568627451, 0.12156862745098039]}
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=13061821] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [0.7803921568627451, 0.3058823529411765, 0.7411764705882353]}
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=16351261] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [0.9764705882352941, 0.5019607843137255, 0.11372549019607843]}
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=15961002] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [0.9529411764705882, 0.5450980392156862, 0.6666666666666666]}
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=8991416] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [0.5372549019607843, 0.19607843137254902, 0.7215686274509804]}
execute if items entity @s weapon.mainhand *[minecraft:dyed_color=11546150] run return run data modify storage lockdown:temp paint set value {mode: "primary", color: [0.6901960784313725, 0.1803921568627451, 0.14901960784313725]}

# Also possible to be holding spray can in off-hand
execute if items entity @s weapon.offhand *[minecraft:dyed_color=16383998] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [1.0, 1.0, 1.0]}
execute if items entity @s weapon.offhand *[minecraft:dyed_color=16701501] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [0.996078431372549, 0.8470588235294118, 0.23921568627450981]}
execute if items entity @s weapon.offhand *[minecraft:dyed_color=1908001] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [0.11372549019607843, 0.11372549019607843, 0.12941176470588237]}
execute if items entity @s weapon.offhand *[minecraft:dyed_color=3949738] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [0.23529411764705882, 0.26666666666666666, 0.6666666666666666]}
execute if items entity @s weapon.offhand *[minecraft:dyed_color=8606770] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [0.5137254901960784, 0.32941176470588235, 0.19607843137254902]}
execute if items entity @s weapon.offhand *[minecraft:dyed_color=1481884] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [0.08627450980392157, 0.611764705882353, 0.611764705882353]}
execute if items entity @s weapon.offhand *[minecraft:dyed_color=4673362] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [0.2784313725490196, 0.30980392156862746, 0.3215686274509804]}
execute if items entity @s weapon.offhand *[minecraft:dyed_color=6192150] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [0.3686274509803922, 0.48627450980392156, 0.08627450980392157]}
#execute if items entity @s weapon.offhand *[minecraft:dyed_color=3847130] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [0.22745098039215686, 0.7019607843137254, 0.8549019607843137]}
execute if items entity @s weapon.offhand *[minecraft:dyed_color=3847130] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [0.200, 0.604, 0.988]}
execute if items entity @s weapon.offhand *[minecraft:dyed_color=10329495] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [0.615686274509804, 0.615686274509804, 0.592156862745098]}
execute if items entity @s weapon.offhand *[minecraft:dyed_color=8439583] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [0.5019607843137255, 0.7803921568627451, 0.12156862745098039]}
execute if items entity @s weapon.offhand *[minecraft:dyed_color=13061821] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [0.7803921568627451, 0.3058823529411765, 0.7411764705882353]}
execute if items entity @s weapon.offhand *[minecraft:dyed_color=16351261] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [0.9764705882352941, 0.5019607843137255, 0.11372549019607843]}
execute if items entity @s weapon.offhand *[minecraft:dyed_color=15961002] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [0.9529411764705882, 0.5450980392156862, 0.6666666666666666]}
execute if items entity @s weapon.offhand *[minecraft:dyed_color=8991416] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [0.5372549019607843, 0.19607843137254902, 0.7215686274509804]}
execute if items entity @s weapon.offhand *[minecraft:dyed_color=11546150] run return run data modify storage lockdown:temp paint set value {mode: "secondary", color: [0.6901960784313725, 0.1803921568627451, 0.14901960784313725]}
