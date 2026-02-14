# 毎tick実行される処理

# アクティブな場合のみ実行
execute if score #global spmob.state.active matches 1 run function spmob:internal/tick_active

# 可視化が有効な場合、20tickごとに範囲を表示
execute if score #global spmob.state.visual matches 1 run function spmob:internal/visualize_check
