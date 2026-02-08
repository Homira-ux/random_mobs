# すべての設定をデフォルト値にリセット

# スポーンを停止
scoreboard players set #global spmob.state.active 0
scoreboard players set #global spmob.state.timer 0

# デフォルト値の復元
scoreboard players set #global spmob.config.interval 100
scoreboard players set #global spmob.config.count 5
scoreboard players set #global spmob.config.probability 100
scoreboard players set #global spmob.state.visual 0
scoreboard players set #global spmob.state.debug 0

# 座標をリセット
scoreboard players set #global spmob.pos.x1 0
scoreboard players set #global spmob.pos.y1 0
scoreboard players set #global spmob.pos.z1 0
scoreboard players set #global spmob.pos.x2 0
scoreboard players set #global spmob.pos.y2 0
scoreboard players set #global spmob.pos.z2 0

# 範囲をリセット
scoreboard players set #global spmob.pos.min_x 0
scoreboard players set #global spmob.pos.min_y 0
scoreboard players set #global spmob.pos.min_z 0
scoreboard players set #global spmob.pos.max_x 0
scoreboard players set #global spmob.pos.max_y 0
scoreboard players set #global spmob.pos.max_z 0
scoreboard players set #global spmob.config.range_x 1
scoreboard players set #global spmob.config.range_y 1
scoreboard players set #global spmob.config.range_z 1

# ストレージをリセット
data modify storage spmob:config mob_type set value "minecraft:cow"
data modify storage spmob:config nbt_data set value ""

tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"すべての設定をリセットしました","color":"white"}]