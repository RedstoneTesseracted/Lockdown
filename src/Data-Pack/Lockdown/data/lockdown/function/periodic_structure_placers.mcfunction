# This function runs all special structure placers every 10 seconds (if any exist).

function lockdown:place_block/run_structure_placers
schedule function lockdown:periodic_structure_placers 10s
