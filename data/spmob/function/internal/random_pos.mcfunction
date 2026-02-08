# ランダムな座標を生成

# X座標のランダム生成
summon minecraft:marker ~ ~ ~ {Tags:["spmob.random_x"]}
execute store result score #global spmob.temp run data get entity @e[type=minecraft:marker,tag=spmob.random_x,limit=1] UUID[0]
kill @e[type=minecraft:marker,tag=spmob.random_x]

# 負の値を正にする
execute if score #global spmob.temp matches ..-1 run scoreboard players operation #global spmob.temp *= #-1 spmob.const

# 範囲内に収める
scoreboard players operation #global spmob.temp %= #global spmob.config.range_x
scoreboard players operation #global spmob.temp += #global spmob.pos.min_x
scoreboard players operation #global spmob.temp.spawn_x = #global spmob.temp


# Y座標のランダム生成
summon minecraft:marker ~ ~ ~ {Tags:["spmob.random_y"]}
execute store result score #global spmob.temp run data get entity @e[type=minecraft:marker,tag=spmob.random_y,limit=1] UUID[0]
kill @e[type=minecraft:marker,tag=spmob.random_y]

# 負の値を正にする
execute if score #global spmob.temp matches ..-1 run scoreboard players operation #global spmob.temp *= #-1 spmob.const

# 範囲内に収める
scoreboard players operation #global spmob.temp %= #global spmob.config.range_y
scoreboard players operation #global spmob.temp += #global spmob.pos.min_y
scoreboard players operation #global spmob.temp.spawn_y = #global spmob.temp


# Z座標のランダム生成
summon minecraft:marker ~ ~ ~ {Tags:["spmob.random_z"]}
execute store result score #global spmob.temp run data get entity @e[type=minecraft:marker,tag=spmob.random_z,limit=1] UUID[0]
kill @e[type=minecraft:marker,tag=spmob.random_z]

# 負の値を正にする
execute if score #global spmob.temp matches ..-1 run scoreboard players operation #global spmob.temp *= #-1 spmob.const

# 範囲内に収める
scoreboard players operation #global spmob.temp %= #global spmob.config.range_z
scoreboard players operation #global spmob.temp += #global spmob.pos.min_z
scoreboard players operation #global spmob.temp.spawn_z = #global spmob.temp