# 第1点の座標を設定

execute store result score #global spmob.pos.x1 run data get entity @s Pos[0]
execute store result score #global spmob.pos.y1 run data get entity @s Pos[1]
execute store result score #global spmob.pos.z1 run data get entity @s Pos[2]

tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"第1点を設定: ","color":"white"},{"score":{"name":"#global","objective":"spmob.pos.x1"},"color":"aqua"},{"text":", ","color":"white"},{"score":{"name":"#global","objective":"spmob.pos.y1"},"color":"aqua"},{"text":", ","color":"white"},{"score":{"name":"#global","objective":"spmob.pos.z1"},"color":"aqua"}]