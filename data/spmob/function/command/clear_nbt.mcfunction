# メインモブのNBTデータをクリア
# NBT未設定状態にするため、キーを削除する

data remove storage spmob:config nbt_data_main
data remove storage spmob:config nbt_data

tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"メインモブのNBTデータをクリアしました","color":"white"}]
