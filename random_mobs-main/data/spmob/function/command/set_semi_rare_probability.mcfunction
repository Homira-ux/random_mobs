# 準レアモブの出現確率を設定（マクロ関数）
# value: 0.0-100.0の数値（小数点1桁まで対応）
# 内部的には10倍して保存（15.5% → 155）

# スコアボードに確率を保存（10倍のスケール）
$scoreboard players set #global spmob.config.semi_rare_prob $(value)

# ストレージのレアモブ配列[1]にも保存（将来の拡張用）
$data modify storage spmob:config rare_mobs[1].probability set value $(value)

# 範囲チェック（0-1000の範囲＝0.0%-100.0%）
execute if score #global spmob.config.semi_rare_prob matches 1001.. run scoreboard players set #global spmob.config.semi_rare_prob 1000
execute if score #global spmob.config.semi_rare_prob matches ..-1 run scoreboard players set #global spmob.config.semi_rare_prob 0

# 表示用に10で割る（整数部と小数部を計算）
scoreboard players operation #temp spmob.temp = #global spmob.config.semi_rare_prob
scoreboard players operation #temp_int spmob.temp = #temp spmob.temp
scoreboard players operation #temp_int spmob.temp /= #10 spmob.const
scoreboard players operation #temp_dec spmob.temp = #temp spmob.temp
scoreboard players operation #temp_dec spmob.temp %= #10 spmob.const

# 範囲チェック後の値を表示（小数点1桁）
tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"準レア出現確率を設定: ","color":"white"},{"score":{"name":"#temp_int","objective":"spmob.temp"},"color":"yellow"},{"text":".","color":"yellow"},{"score":{"name":"#temp_dec","objective":"spmob.temp"},"color":"yellow"},{"text":"%","color":"yellow"}]
