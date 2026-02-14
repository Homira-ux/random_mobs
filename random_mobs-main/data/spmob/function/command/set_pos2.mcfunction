# 第2点の座標を設定

execute store result score #global spmob.pos.x2 run data get entity @s Pos[0]
execute store result score #global spmob.pos.y2 run data get entity @s Pos[1]
execute store result score #global spmob.pos.z2 run data get entity @s Pos[2]

# 範囲を正規化
function spmob:internal/normalize_range

tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"第2点を設定: ","color":"white"},{"score":{"name":"#global","objective":"spmob.pos.x2"},"color":"aqua"},{"text":", ","color":"white"},{"score":{"name":"#global","objective":"spmob.pos.y2"},"color":"aqua"},{"text":", ","color":"white"},{"score":{"name":"#global","objective":"spmob.pos.z2"},"color":"aqua"}]