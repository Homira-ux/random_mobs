# スポーンするモブを設定（マクロ関数）
# メインモブとして設定されます

# ストレージにモブタイプを保存（メイン）
$data modify storage spmob:config mob_type_main set value "$(mob)"

# 後方互換性のため旧キーにも保存
$data modify storage spmob:config mob_type set value "$(mob)"

$tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"メインモブを設定: ","color":"white"},{"text":"$(mob)","color":"aqua"}]