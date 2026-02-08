# モブをスポーン（マクロ関数）
# ストレージから座標情報を取得してスポーン

# DEBUG: Log storage content before calling spawn_mob_execute
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] spawn_mob called","color":"yellow"}]
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Storage content - mob_type: ","color":"yellow"},{"nbt":"mob_type","storage":"spmob:temp","color":"aqua"}]
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Storage content - spawn_x: ","color":"yellow"},{"nbt":"spawn_x","storage":"spmob:temp","color":"aqua"}]
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Storage content - spawn_y: ","color":"yellow"},{"nbt":"spawn_y","storage":"spmob:temp","color":"aqua"}]
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Storage content - spawn_z: ","color":"yellow"},{"nbt":"spawn_z","storage":"spmob:temp","color":"aqua"}]
# nbt_dataキーが存在する場合のみ表示
execute if score #global spmob.state.debug matches 1.. if data storage spmob:temp nbt_data run tellraw @a [{"text":"[DEBUG] Storage content - nbt_data: ","color":"yellow"},{"nbt":"nbt_data","storage":"spmob:temp","color":"aqua"}]
execute if score #global spmob.state.debug matches 1.. unless data storage spmob:temp nbt_data run tellraw @a [{"text":"[DEBUG] Storage content - nbt_data: ","color":"yellow"},{"text":"(not set)","color":"gray"}]

# NBTデータの有無（キー存在）を確認して適切な関数を呼び出す
# nbt_dataキーが存在する=NBTあり、存在しない=NBTなし
execute if data storage spmob:temp nbt_data run function spmob:internal/spawn_mob_execute_with_nbt with storage spmob:temp
execute unless data storage spmob:temp nbt_data run function spmob:internal/spawn_mob_execute_no_nbt with storage spmob:temp