# デバッグログ表示をON/OFF

# 一時変数に現在の状態を保存
scoreboard players operation #global spmob.temp = #global spmob.state.debug

# 状態を反転
execute if score #global spmob.temp matches 0 run scoreboard players set #global spmob.state.debug 1
execute if score #global spmob.temp matches 1.. run scoreboard players set #global spmob.state.debug 0

# メッセージ
execute if score #global spmob.state.debug matches 1 run tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"デバッグログをONにしました","color":"green"}]
execute if score #global spmob.state.debug matches 0 run tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"デバッグログをOFFにしました","color":"red"}]