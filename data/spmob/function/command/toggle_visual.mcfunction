# 範囲の可視化をON/OFF

# 一時変数に現在の状態を保存
scoreboard players operation #global spmob.temp = #global spmob.state.visual

# 状態を反転
execute if score #global spmob.temp matches 0 run scoreboard players set #global spmob.state.visual 1
execute if score #global spmob.temp matches 1.. run scoreboard players set #global spmob.state.visual 0

# メッセージ
execute if score #global spmob.state.visual matches 1 run tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"可視化をONにしました","color":"green"}]
execute if score #global spmob.state.visual matches 0 run tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"可視化をOFFにしました","color":"red"}]