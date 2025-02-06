# This function builds the lock predicate using macros because Minecraft will hunt you down and DESTROY you otherwise

data remove storage lockdown:temp key.lock
$data modify storage lockdown:temp key.lock set value {predicates:{"minecraft:custom_data":"{lockdown_data:{channel:$(channel)}}"}}
