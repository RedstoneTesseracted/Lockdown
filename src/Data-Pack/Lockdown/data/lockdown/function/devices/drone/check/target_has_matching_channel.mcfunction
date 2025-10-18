# This function checks if the current target has a matching channel score
execute on vehicle on target if predicate lockdown:local_channel_matches run return 1
return 0
