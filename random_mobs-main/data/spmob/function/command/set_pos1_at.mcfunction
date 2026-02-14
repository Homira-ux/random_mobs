# 第1点の座標を引数で設定（マクロ関数）
# 使い方: /function spmob:command/set_pos1_at {x:100,y:64,z:200}

# スコアボードに座標を保存
$scoreboard players set #global spmob.pos.x1 $(x)
$scoreboard players set #global spmob.pos.y1 $(y)
$scoreboard players set #global spmob.pos.z1 $(z)

$tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"第1点を設定: ","color":"white"},{"text":"$(x), $(y), $(z)","color":"aqua"}]
