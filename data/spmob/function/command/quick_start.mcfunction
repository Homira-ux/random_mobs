# クイックスタート（マクロ関数）
# 座標範囲とすべての設定をまとめて実行してスポーン開始
# 
# 使い方:
# /function spmob:command/quick_start {x1:0,y1:60,z1:0,x2:50,y2:80,z2:50,mob:"minecraft:cow",interval:200,count:50,rare_mob:"minecraft:mooshroom",rare_prob:10}

# 座標範囲を設定
$scoreboard players set #global spmob.pos.x1 $(x1)
$scoreboard players set #global spmob.pos.y1 $(y1)
$scoreboard players set #global spmob.pos.z1 $(z1)
$scoreboard players set #global spmob.pos.x2 $(x2)
$scoreboard players set #global spmob.pos.y2 $(y2)
$scoreboard players set #global spmob.pos.z2 $(z2)

# 範囲を正規化
function spmob:internal/normalize_range

# メインモブを設定
$data modify storage spmob:config mob_type_main set value "$(mob)"
$data modify storage spmob:config mob_type set value "$(mob)"

# スポーン設定
$scoreboard players set #global spmob.config.interval $(interval)
$scoreboard players set #global spmob.config.count $(count)

# レアモブを設定
$data modify storage spmob:config rare_mobs[0].mob_type set value "$(rare_mob)"
$scoreboard players set #global spmob.config.rare_prob $(rare_prob)
$data modify storage spmob:config rare_mobs[0].probability set value $(rare_prob)

# スポーン開始
scoreboard players set #global spmob.state.active 1
scoreboard players set #global spmob.state.timer 0
scoreboard players set #global spmob.state.first_spawn 1

$tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"クイックスタート完了！","color":"green"}]
$tellraw @s [{"text":"範囲: ","color":"gray"},{"text":"($(x1), $(y1), $(z1)) - ($(x2), $(y2), $(z2))","color":"aqua"}]
$tellraw @s [{"text":"メイン: ","color":"gray"},{"text":"$(mob)","color":"aqua"},{"text":" / レア: ","color":"gray"},{"text":"$(rare_mob)","color":"light_purple"}]
$tellraw @s [{"text":"間隔: ","color":"gray"},{"text":"$(interval)","color":"aqua"},{"text":"tick / 数: ","color":"gray"},{"text":"$(count)","color":"aqua"}]
