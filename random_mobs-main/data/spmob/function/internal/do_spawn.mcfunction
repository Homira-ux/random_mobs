# Actually execute spawn

# DEBUG: Log spawn execution
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Executing spawn","color":"green"}]

# Generate random coordinates
function spmob:internal/random_pos

# Copy coordinates to storage
execute store result storage spmob:temp spawn_x int 1 run scoreboard players get #global spmob.temp.spawn_x
execute store result storage spmob:temp spawn_y int 1 run scoreboard players get #global spmob.temp.spawn_y
execute store result storage spmob:temp spawn_z int 1 run scoreboard players get #global spmob.temp.spawn_z

# 3段階レア判定：UUID乱数で0-999の値を生成し、rare_prob、semi_rare_probと比較
summon minecraft:marker ~ ~ ~ {Tags:["spmob.rare_rand"]}
execute store result score #global spmob.temp run data get entity @n[type=minecraft:marker,tag=spmob.rare_rand] UUID[0]
kill @e[type=minecraft:marker,tag=spmob.rare_rand]

# 負の値を正にする
execute if score #global spmob.temp matches ..-1 run scoreboard players operation #global spmob.temp *= #-1 spmob.const

# 1000で割った余りを取得（0-999の範囲、小数点1桁対応）
scoreboard players set #1000 spmob.const 1000
scoreboard players operation #global spmob.temp %= #1000 spmob.const

# rare_prob + semi_rare_probの合計を計算（一時変数に保存）
scoreboard players operation #rare_semi_threshold spmob.temp = #global spmob.config.rare_prob
scoreboard players operation #rare_semi_threshold spmob.temp += #global spmob.config.semi_rare_prob

# DEBUG: Log rare roll
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Rarity roll: ","color":"yellow"},{"score":{"name":"#global","objective":"spmob.temp"},"color":"aqua"},{"text":" (rare<","color":"white"},{"score":{"name":"#global","objective":"spmob.config.rare_prob"},"color":"light_purple"},{"text":", semi<","color":"white"},{"score":{"name":"#rare_semi_threshold","objective":"spmob.temp"},"color":"yellow"},{"text":")","color":"white"}]

# 3段階判定の結果によってモブとNBTを選択
# 第1判定：レアモブ（最も希少）
execute if score #global spmob.temp < #global spmob.config.rare_prob run data modify storage spmob:temp mob_type set from storage spmob:config rare_mobs[0].mob_type
execute if score #global spmob.temp < #global spmob.config.rare_prob run data modify storage spmob:temp is_rare set value 1b
# レアのNBTがあれば設定、なければ削除（未設定状態にする）
execute if score #global spmob.temp < #global spmob.config.rare_prob if data storage spmob:config rare_mobs[0].nbt_data run data modify storage spmob:temp nbt_data set from storage spmob:config rare_mobs[0].nbt_data
execute if score #global spmob.temp < #global spmob.config.rare_prob unless data storage spmob:config rare_mobs[0].nbt_data run data remove storage spmob:temp nbt_data

# 第2判定：準レアモブ（中間の希少度）
execute unless score #global spmob.temp < #global spmob.config.rare_prob if score #global spmob.temp < #rare_semi_threshold spmob.temp run data modify storage spmob:temp mob_type set from storage spmob:config rare_mobs[1].mob_type
execute unless score #global spmob.temp < #global spmob.config.rare_prob if score #global spmob.temp < #rare_semi_threshold spmob.temp run data modify storage spmob:temp is_rare set value 2b
# 準レアのNBTがあれば設定、なければ削除（未設定状態にする）
execute unless score #global spmob.temp < #global spmob.config.rare_prob if score #global spmob.temp < #rare_semi_threshold spmob.temp if data storage spmob:config rare_mobs[1].nbt_data run data modify storage spmob:temp nbt_data set from storage spmob:config rare_mobs[1].nbt_data
execute unless score #global spmob.temp < #global spmob.config.rare_prob if score #global spmob.temp < #rare_semi_threshold spmob.temp unless data storage spmob:config rare_mobs[1].nbt_data run data remove storage spmob:temp nbt_data

# 第3判定：通常モブ（デフォルト）
execute unless score #global spmob.temp < #global spmob.config.rare_prob unless score #global spmob.temp < #rare_semi_threshold spmob.temp run data modify storage spmob:temp mob_type set from storage spmob:config mob_type_main
execute unless score #global spmob.temp < #global spmob.config.rare_prob unless score #global spmob.temp < #rare_semi_threshold spmob.temp run data modify storage spmob:temp is_rare set value 0b
# 通常のNBTがあれば設定、なければ削除（未設定状態にする）
execute unless score #global spmob.temp < #global spmob.config.rare_prob unless score #global spmob.temp < #rare_semi_threshold spmob.temp if data storage spmob:config nbt_data_main run data modify storage spmob:temp nbt_data set from storage spmob:config nbt_data_main
execute unless score #global spmob.temp < #global spmob.config.rare_prob unless score #global spmob.temp < #rare_semi_threshold spmob.temp unless data storage spmob:config nbt_data_main run data remove storage spmob:temp nbt_data

# DEBUG: Log spawn coordinates and mob type
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Spawn at: ","color":"green"},{"score":{"name":"#global","objective":"spmob.temp.spawn_x"},"color":"aqua"},{"text":", ","color":"white"},{"score":{"name":"#global","objective":"spmob.temp.spawn_y"},"color":"aqua"},{"text":", ","color":"white"},{"score":{"name":"#global","objective":"spmob.temp.spawn_z"},"color":"aqua"}]
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Mob type: ","color":"green"},{"nbt":"mob_type","storage":"spmob:temp","color":"aqua"}]
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] NBT data: ","color":"green"},{"nbt":"nbt_data","storage":"spmob:temp","color":"aqua"}]
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Is rare: ","color":"green"},{"nbt":"is_rare","storage":"spmob:temp","color":"light_purple"}]

# Spawn mob (using macro with all parameters)
function spmob:internal/spawn_mob with storage spmob:temp
