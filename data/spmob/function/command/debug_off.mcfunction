# Turn off debug mode by removing debug functions
# To disable debug: manually remove debug tellraw commands from:
# - internal/spawn_attempt.mcfunction
# - internal/do_spawn.mcfunction  
# - internal/spawn_mob_execute.mcfunction
# - internal/spawn_cycle.mcfunction

tellraw @s [{"text":"[SpMob] Debug messages are in the code.","color":"yellow"}]
tellraw @s [{"text":"[SpMob] Edit mcfunction files to remove tellraw lines.","color":"yellow"}]
