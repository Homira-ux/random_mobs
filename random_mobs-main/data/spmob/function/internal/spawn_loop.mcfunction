# スポーンループ処理（再帰呼び出し）

# カウンターが0より大きい間、スポーン試行を実行
execute if score #global spmob.temp.counter matches 1.. run function spmob:internal/spawn_attempt

# カウンターをデクリメント
scoreboard players remove #global spmob.temp.counter 1

# カウンターがまだ残っている場合は再帰呼び出し
execute if score #global spmob.temp.counter matches 1.. run function spmob:internal/spawn_loop
