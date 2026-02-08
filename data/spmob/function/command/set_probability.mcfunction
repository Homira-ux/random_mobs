# スポーン確率を設定（マクロ関数）

# 値を0-100の範囲に制限
$scoreboard players set #global spmob.config.probability $(value)
execute if score #global spmob.config.probability matches ..0 run scoreboard players set #global spmob.config.probability 0
execute if score #global spmob.config.probability matches 101.. run scoreboard players set #global spmob.config.probability 100

# 0の場合の警告
execute if score #global spmob.config.probability matches 0 run tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"警告: 確率が0%に設定されているため、モブはスポーンしません","color":"red"}]

# 100の場合のメッセージ
execute if score #global spmob.config.probability matches 100 run tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"確率が100%に設定されました（常にスポーン）","color":"green"}]

# 通常のメッセージ
execute if score #global spmob.config.probability matches 1..99 run tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"スポーン確率を設定: ","color":"white"},{"score":{"name":"#global","objective":"spmob.config.probability"},"color":"aqua"},{"text":"%","color":"white"}]