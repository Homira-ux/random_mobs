# Execute actual summon command (Macro function)

# DEBUG: Function called (non-macro line to ensure execution)
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] spawn_mob_execute CALLED","color":"red","bold":true}]

# DEBUG: Log mob type and coordinates
$execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Summoning mob: ","color":"green"},{"text":"$(mob_type)","color":"aqua"},{"text":" at $(spawn_x) $(spawn_y) $(spawn_z)","color":"yellow"}]

# Summon mob at absolute coordinates with NBT if provided
$summon $(mob_type) $(spawn_x) $(spawn_y) $(spawn_z) $(nbt_data)

# DEBUG: Confirm spawn
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Spawn command executed","color":"green"}]
