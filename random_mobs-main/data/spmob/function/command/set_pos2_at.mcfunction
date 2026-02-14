# 第2点の座標を引数で設定（マクロ関数）
# 使い方: /function spmob:command/set_pos2_at {x:200,y:80,z:300}

# スコアボードに座標を保存
$scoreboard players set #global spmob.pos.x2 $(x)
$scoreboard players set #global spmob.pos.y2 $(y)
$scoreboard players set #global spmob.pos.z2 $(z)

# 範囲を正規化
function spmob:internal/normalize_range

$tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"第2点を設定: ","color":"white"},{"text":"$(x), $(y), $(z)","color":"aqua"}]
