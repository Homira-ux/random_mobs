# 1回のスポーン数を設定（マクロ関数）

# スコアボードにスポーン数を保存
$scoreboard players set #global spmob.config.count $(value)

$tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"スポーン数を設定: ","color":"white"},{"text":"$(value)","color":"aqua"}]