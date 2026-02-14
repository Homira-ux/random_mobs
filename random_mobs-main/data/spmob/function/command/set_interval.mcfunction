# スポーン間隔を設定（マクロ関数）

# スコアボードに間隔を保存
$scoreboard players set #global spmob.config.interval $(value)

$tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"スポーン間隔を設定: ","color":"white"},{"text":"$(value)","color":"aqua"},{"text":" tick","color":"white"}]