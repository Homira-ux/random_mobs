# スポーン範囲の可視化

# パーティクルの設定
execute store result storage spmob:visual min_x int 1 run scoreboard players get #global spmob.pos.min_x
execute store result storage spmob:visual min_y int 1 run scoreboard players get #global spmob.pos.min_y
execute store result storage spmob:visual min_z int 1 run scoreboard players get #global spmob.pos.min_z
execute store result storage spmob:visual max_x int 1 run scoreboard players get #global spmob.pos.max_x
execute store result storage spmob:visual max_y int 1 run scoreboard players get #global spmob.pos.max_y
execute store result storage spmob:visual max_z int 1 run scoreboard players get #global spmob.pos.max_z

# パーティクル描画
function spmob:internal/visualize_draw with storage spmob:visual