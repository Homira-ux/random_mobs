# モブスポーンを開始

scoreboard players set #global spmob.state.active 1
scoreboard players set #global spmob.state.timer 0
scoreboard players set #global spmob.state.first_spawn 1

# 間隔を秒に変換 (20tick = 1秒)
scoreboard players operation #global spmob.temp = #global spmob.config.interval
scoreboard players set #20 spmob.const 20
scoreboard players operation #global spmob.temp /= #20 spmob.const

tellraw @a [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"モブスポーンを開始しました","color":"green"}]
tellraw @a [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"開始まで ","color":"gray"},{"score":{"name":"#global","objective":"spmob.temp"},"color":"aqua"},{"text":" 秒","color":"gray"}]