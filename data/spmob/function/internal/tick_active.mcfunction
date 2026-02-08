# アクティブ時のtick処理

# タイマーをインクリメント
scoreboard players add #global spmob.state.timer 1

# 残り時間を計算（カウントダウン表示用、最初のスポーンのみ）
execute if score #global spmob.state.first_spawn matches 1 run scoreboard players operation #global spmob.temp = #global spmob.config.interval
execute if score #global spmob.state.first_spawn matches 1 run scoreboard players operation #global spmob.temp -= #global spmob.state.timer

# 残り時間をtickから秒に変換 (20tick = 1秒)
execute if score #global spmob.state.first_spawn matches 1 run scoreboard players operation #global spmob.temp /= #20 spmob.const

# 秒で表示（最初のスポーンまでのみ表示）
execute if score #global spmob.state.first_spawn matches 1 run title @a actionbar [{"text":"開始まで: ","color":"gold"},{"score":{"name":"#global","objective":"spmob.temp"},"color":"aqua"},{"text":" 秒","color":"white"}]

# タイマーが設定された間隔に到達したらスポーンサイクルを実行
execute if score #global spmob.state.timer >= #global spmob.config.interval run function spmob:internal/spawn_cycle
