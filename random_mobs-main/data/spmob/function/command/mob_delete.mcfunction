# スポーンされたモブを削除するコマンド
# セットされた通常モブ、レアモブ、準レアモブをすべてキルし、
# その後すべてのアイテムをキルします

# メインモブをキル（ストレージから読み込んでマクロ実行）
execute if data storage spmob:config mob_type_main run function spmob:internal/delete_main_mob with storage spmob:config

# レアモブをキル
execute if data storage spmob:config rare_mobs[0].mob_type run function spmob:internal/delete_rare_mob with storage spmob:config rare_mobs[0]

# 準レアモブをキル
execute if data storage spmob:config rare_mobs[1].mob_type run function spmob:internal/delete_semi_rare_mob with storage spmob:config rare_mobs[1]

# すべてのアイテムをキル
kill @e[type=minecraft:item]

# 完了メッセージ
tellraw @a [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"スポーンされたモブとアイテムを削除しました","color":"red"}]
