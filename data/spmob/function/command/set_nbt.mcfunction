# モブのNBTデータを設定（マクロ関数）
# メインモブのNBTとして設定されます
# 使い方: /function spmob:command/set_nbt {nbt:{CustomName:'{"text":"Boss"}'}}
# クリア: /function spmob:command/set_nbt {nbt:{}}

# ストレージにNBTデータを保存（メイン）
$data modify storage spmob:config nbt_data_main set value $(nbt)

# 後方互換性のため旧キーにも保存
$data modify storage spmob:config nbt_data set value $(nbt)

tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"メインモブのNBTデータを設定しました: ","color":"white"},{"nbt":"nbt_data_main","storage":"spmob:config","color":"aqua"}]