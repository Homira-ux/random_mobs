# Spawn cycle process
# Reset timer and execute spawn attempts for configured count

# 最初のスポーンフラグをオフにして、カウントダウン表示を停止
scoreboard players set #global spmob.state.first_spawn 0
title @a actionbar {"text":""}

# DEBUG: Log spawn cycle start
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] ===== Spawn Cycle Start =====","color":"gold","bold":true}]
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] Count: ","color":"gold"},{"score":{"name":"#global","objective":"spmob.config.count"},"color":"aqua"}]

# Reset timer
scoreboard players set #global spmob.state.timer 0

# Initialize counter
scoreboard players operation #global spmob.temp.counter = #global spmob.config.count

# Start spawn loop
function spmob:internal/spawn_loop

# DEBUG: Log spawn cycle end
execute if score #global spmob.state.debug matches 1.. run tellraw @a [{"text":"[DEBUG] ===== Spawn Cycle End =====","color":"gold","bold":true}]
