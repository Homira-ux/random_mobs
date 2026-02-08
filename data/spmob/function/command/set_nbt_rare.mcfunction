# レアモブのNBTデータを設定（マクロ関数）
# 使い方: /function spmob:command/set_nbt_rare {nbt:{CustomName:'{"text":"Rare"}'}}
# クリア: /function spmob:command/set_nbt_rare {nbt:{}}

# ストレージのレアモブ配列[0]にNBTデータを保存
$data modify storage spmob:config rare_mobs[0].nbt_data set value $(nbt)

tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"レアモブのNBTデータを設定しました: ","color":"white"},{"nbt":"rare_mobs[0].nbt_data","storage":"spmob:config","color":"aqua"}]
