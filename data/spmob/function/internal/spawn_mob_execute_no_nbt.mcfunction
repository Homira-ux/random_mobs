# Execute actual summon command without NBT (Macro function)

# DEBUG: Function called
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] spawn_mob_execute_no_nbt CALLED","color":"red","bold":true}]

# DEBUG: Log mob type and coordinates
$execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Summoning: ","color":"green"},{"text":"$(mob_type)","color":"aqua"},{"text":" at $(spawn_x) $(spawn_y) $(spawn_z)","color":"yellow"}]
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Without NBT","color":"gray"}]

# Summon mob at absolute coordinates without NBT
$summon $(mob_type) $(spawn_x) $(spawn_y) $(spawn_z)

# DEBUG: Confirm spawn
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Spawn command executed","color":"green"}]

