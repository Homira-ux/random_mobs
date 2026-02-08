# Actually execute spawn

# DEBUG: Log spawn execution
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Executing spawn","color":"green"}]

# Generate random coordinates
function spmob:internal/random_pos

# Copy coordinates to storage
execute store result storage spmob:temp spawn_x int 1 run scoreboard players get #global spmob.temp.spawn_x
execute store result storage spmob:temp spawn_y int 1 run scoreboard players get #global spmob.temp.spawn_y
execute store result storage spmob:temp spawn_z int 1 run scoreboard players get #global spmob.temp.spawn_z

# レア判定：UUID乱数で0-999の値を生成し、rare_prob（10倍スケール）と比較
summon minecraft:marker ~ ~ ~ {Tags:["spmob.rare_rand"]}
execute store result score #global spmob.temp run data get entity @n[type=minecraft:marker,tag=spmob.rare_rand] UUID[0]
kill @e[type=minecraft:marker,tag=spmob.rare_rand]

# 負の値を正にする
execute if score #global spmob.temp matches ..-1 run scoreboard players operation #global spmob.temp *= #-1 spmob.const

# 1000で割った余りを取得（0-999の範囲、小数点1桁対応）
scoreboard players set #1000 spmob.const 1000
scoreboard players operation #global spmob.temp %= #1000 spmob.const

# DEBUG: Log rare roll
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Rare roll: ","color":"yellow"},{"score":{"name":"#global","objective":"spmob.temp"},"color":"aqua"},{"text":" < ","color":"white"},{"score":{"name":"#global","objective":"spmob.config.rare_prob"},"color":"aqua"},{"text":" ?","color":"white"}]

# レア判定の結果によってモブとNBTを選択
# レアの場合
execute if score #global spmob.temp < #global spmob.config.rare_prob run data modify storage spmob:temp mob_type set from storage spmob:config rare_mobs[0].mob_type
execute if score #global spmob.temp < #global spmob.config.rare_prob run data modify storage spmob:temp is_rare set value 1b
# レアのNBTがあれば設定、なければ削除（未設定状態にする）
execute if score #global spmob.temp < #global spmob.config.rare_prob if data storage spmob:config rare_mobs[0].nbt_data run data modify storage spmob:temp nbt_data set from storage spmob:config rare_mobs[0].nbt_data
execute if score #global spmob.temp < #global spmob.config.rare_prob unless data storage spmob:config rare_mobs[0].nbt_data run data remove storage spmob:temp nbt_data

# 通常の場合
execute unless score #global spmob.temp < #global spmob.config.rare_prob run data modify storage spmob:temp mob_type set from storage spmob:config mob_type_main
execute unless score #global spmob.temp < #global spmob.config.rare_prob run data modify storage spmob:temp is_rare set value 0b
# 通常のNBTがあれば設定、なければ削除（未設定状態にする）
execute unless score #global spmob.temp < #global spmob.config.rare_prob if data storage spmob:config nbt_data_main run data modify storage spmob:temp nbt_data set from storage spmob:config nbt_data_main
execute unless score #global spmob.temp < #global spmob.config.rare_prob unless data storage spmob:config nbt_data_main run data remove storage spmob:temp nbt_data

# DEBUG: Log spawn coordinates and mob type
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Spawn at: ","color":"green"},{"score":{"name":"#global","objective":"spmob.temp.spawn_x"},"color":"aqua"},{"text":", ","color":"white"},{"score":{"name":"#global","objective":"spmob.temp.spawn_y"},"color":"aqua"},{"text":", ","color":"white"},{"score":{"name":"#global","objective":"spmob.temp.spawn_z"},"color":"aqua"}]
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Mob type: ","color":"green"},{"nbt":"mob_type","storage":"spmob:temp","color":"aqua"}]
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] NBT data: ","color":"green"},{"nbt":"nbt_data","storage":"spmob:temp","color":"aqua"}]
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Is rare: ","color":"green"},{"nbt":"is_rare","storage":"spmob:temp","color":"light_purple"}]

# Spawn mob (using macro with all parameters)
function spmob:internal/spawn_mob with storage spmob:temp
