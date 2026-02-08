# 座標を正規化して最小値と最大値を計算

# X座標の最小値と最大値を計算
scoreboard players operation #global spmob.pos.min_x = #global spmob.pos.x1
scoreboard players operation #global spmob.pos.max_x = #global spmob.pos.x1
execute if score #global spmob.pos.x2 < #global spmob.pos.min_x run scoreboard players operation #global spmob.pos.min_x = #global spmob.pos.x2
execute if score #global spmob.pos.x2 > #global spmob.pos.max_x run scoreboard players operation #global spmob.pos.max_x = #global spmob.pos.x2

# Y座標の最小値と最大値を計算
scoreboard players operation #global spmob.pos.min_y = #global spmob.pos.y1
scoreboard players operation #global spmob.pos.max_y = #global spmob.pos.y1
execute if score #global spmob.pos.y2 < #global spmob.pos.min_y run scoreboard players operation #global spmob.pos.min_y = #global spmob.pos.y2
execute if score #global spmob.pos.y2 > #global spmob.pos.max_y run scoreboard players operation #global spmob.pos.max_y = #global spmob.pos.y2

# Z座標の最小値と最大値を計算
scoreboard players operation #global spmob.pos.min_z = #global spmob.pos.z1
scoreboard players operation #global spmob.pos.max_z = #global spmob.pos.z1
execute if score #global spmob.pos.z2 < #global spmob.pos.min_z run scoreboard players operation #global spmob.pos.min_z = #global spmob.pos.z2
execute if score #global spmob.pos.z2 > #global spmob.pos.max_z run scoreboard players operation #global spmob.pos.max_z = #global spmob.pos.z2

# 範囲を計算（max - min + 1）
scoreboard players operation #global spmob.config.range_x = #global spmob.pos.max_x
scoreboard players operation #global spmob.config.range_x -= #global spmob.pos.min_x
scoreboard players add #global spmob.config.range_x 1

scoreboard players operation #global spmob.config.range_y = #global spmob.pos.max_y
scoreboard players operation #global spmob.config.range_y -= #global spmob.pos.min_y
scoreboard players add #global spmob.config.range_y 1

scoreboard players operation #global spmob.config.range_z = #global spmob.pos.max_z
scoreboard players operation #global spmob.config.range_z -= #global spmob.pos.min_z
scoreboard players add #global spmob.config.range_z 1

# 範囲が0の場合は1に設定（除算エラー防止とポイントスポーン対応）
execute if score #global spmob.config.range_x matches 0 run scoreboard players set #global spmob.config.range_x 1
execute if score #global spmob.config.range_y matches 0 run scoreboard players set #global spmob.config.range_y 1
execute if score #global spmob.config.range_z matches 0 run scoreboard players set #global spmob.config.range_z 1