# レアモブの種類を設定（マクロ関数）

# ストレージのレアモブ配列[0]にモブタイプを保存
$data modify storage spmob:config rare_mobs[0].mob_type set value "$(mob)"

$tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"レアモブを設定: ","color":"white"},{"text":"$(mob)","color":"light_purple"}]
