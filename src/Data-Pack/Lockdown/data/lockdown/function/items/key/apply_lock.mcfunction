# This function locks the current block using the lock data in storage

data modify block ~ ~ ~ lock set from storage lockdown:temp key.lock
title @s actionbar {translate: "lockdown.messages.key.locked"}
return 1
