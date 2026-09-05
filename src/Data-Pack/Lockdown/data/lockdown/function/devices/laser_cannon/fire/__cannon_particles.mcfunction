#$execute rotated $(azimuth) $(pitch) run particle minecraft:flash{color: [1.0, 1.0, 1.0, 1.0]} ^ ^ ^5 0.1 0.1 0.1 1.0 1

#$execute positioned ~ ~1.5625 ~ rotated $(azimuth) 0.0 positioned ^ ^ ^1 rotated ~ $(pitch) run particle minecraft:dust{color: [1.0, 0.0, 0.0], scale: 0.5} ^ ^ ^5 0.0 0.0 0.0 2.0 5
$execute positioned ~ ~1.5625 ~ rotated $(azimuth) 0.0 positioned ^ ^ ^1 rotated ~ $(pitch) run particle minecraft:ominous_spawning ^ ^ ^5 0.0 0.0 0.0 0.75 5
return 1
