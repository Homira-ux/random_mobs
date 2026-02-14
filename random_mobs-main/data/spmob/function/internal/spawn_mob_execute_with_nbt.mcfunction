# Execute actual summon command with NBT (Macro function)
# この関数はnbt_dataキーが存在する場合のみ呼ばれる

# DEBUG: Function called
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] spawn_mob_execute_with_nbt CALLED","color":"red","bold":true}]

# DEBUG: Log mob type and coordinates
$execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Summoning: ","color":"green"},{"text":"$(mob_type)","color":"aqua"},{"text":" at $(spawn_x) $(spawn_y) $(spawn_z)","color":"yellow"}]
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] With NBT: ","color":"green"},{"nbt":"nbt_data","storage":"spmob:temp","color":"light_purple"}]

# Summon mob at absolute coordinates with NBT
# $(nbt_data)はCompoundとして展開される
$summon $(mob_type) $(spawn_x) $(spawn_y) $(spawn_z) $(nbt_data)

# DEBUG: Confirm spawn
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Spawn command executed","color":"green"}]

