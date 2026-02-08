# 可視化のチェック処理（20tickごとに実行）

# タイマーを使って20tickごとに実行
scoreboard players operation #global spmob.temp = #global spmob.state.timer
scoreboard players operation #global spmob.temp %= #20 spmob.const
execute if score #global spmob.temp matches 0 run function spmob:internal/visualize
