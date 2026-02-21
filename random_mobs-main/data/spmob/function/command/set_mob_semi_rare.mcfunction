# 準レアモブの種類を設定（マクロ関数）

# ストレージのレアモブ配列[1]にモブタイプを保存
$data modify storage spmob:config rare_mobs[1].mob_type set value "$(mob)"

$tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"準レアモブを設定: ","color":"white"},{"text":"$(mob)","color":"yellow"}]
