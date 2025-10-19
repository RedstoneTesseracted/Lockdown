# Draw a 1x1x1 cube with the corner at the current position

# Vertices:
#   1: [0, 0, 0]
#   2: [0, 0, 1]
#   3: [0, 1, 0]
#   4: [0, 1, 1]
#   5: [1, 0, 0]
#   6: [1, 0, 1]
#   7: [1, 1, 0]
#   8: [1, 1, 1]
#
# Edges:
#   1 → 2
#   1 → 3
#   1 → 5
#   2 → 4
#   2 → 6
#   3 → 4
#   3 → 7
#   4 → 8
#   5 → 6
#   5 → 7
#   6 → 8
#   7 → 8


# Draw edges (N=5)

# [0, 0, 0] → [0, 0, 1]
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~ ~0.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~ ~0.25 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~ ~0.50 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~ ~0.75 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~ ~1.00 0.0 0.0 0.0 1.0 1

# [0, 0, 0] → [0, 1, 0]
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~0.00 ~ 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~0.25 ~ 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~0.50 ~ 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~0.75 ~ 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~1.00 ~ 0.0 0.0 0.0 1.0 1

# [0, 0, 0] → [1, 0, 0]
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~0.00 ~ ~ 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~0.25 ~ ~ 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~0.50 ~ ~ 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~0.75 ~ ~ 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~ ~ 0.0 0.0 0.0 1.0 1

# [0, 0, 1] → [0, 1, 1]
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~0.00 ~1.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~0.25 ~1.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~0.50 ~1.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~0.75 ~1.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~1.00 ~1.00 0.0 0.0 0.0 1.0 1

# [0, 0, 1] → [1, 0, 1]
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~0.00 ~ ~1.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~0.25 ~ ~1.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~0.50 ~ ~1.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~0.75 ~ ~1.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~ ~1.00 0.0 0.0 0.0 1.0 1

# [0, 1, 0] → [0, 1, 1]
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~1.00 ~0.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~1.00 ~0.25 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~1.00 ~0.50 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~1.00 ~0.75 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~ ~1.00 ~1.00 0.0 0.0 0.0 1.0 1

# [0, 1, 0] → [1, 1, 0]
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~0.00 ~1.00 ~ 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~0.25 ~1.00 ~ 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~0.50 ~1.00 ~ 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~0.75 ~1.00 ~ 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~1.00 ~ 0.0 0.0 0.0 1.0 1

# [0, 1, 1] → [1, 1, 1]
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~0.00 ~1.00 ~1.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~0.25 ~1.00 ~1.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~0.50 ~1.00 ~1.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~0.75 ~1.00 ~1.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~1.00 ~1.00 0.0 0.0 0.0 1.0 1

# [1, 0, 0] → [1, 0, 1]
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~ ~0.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~ ~0.25 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~ ~0.50 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~ ~0.75 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~ ~1.00 0.0 0.0 0.0 1.0 1

# [1, 0, 0] → [1, 1, 0]
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~0.00 ~ 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~0.25 ~ 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~0.50 ~ 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~0.75 ~ 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~1.00 ~ 0.0 0.0 0.0 1.0 1

# [1, 0, 1] → [1, 1, 1]
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~0.00 ~1.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~0.25 ~1.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~0.50 ~1.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~0.75 ~1.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~1.00 ~1.00 0.0 0.0 0.0 1.0 1

# [1, 1, 0] → [1, 1, 1]
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~1.00 ~0.00 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~1.00 ~0.25 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~1.00 ~0.50 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~1.00 ~0.75 0.0 0.0 0.0 1.0 1
$particle minecraft:dust{color:[$(r),$(g),$(b)],scale:0.2f} ~1.00 ~1.00 ~1.00 0.0 0.0 0.0 1.0 1
