# 準レアモブのNBTデータをクリア
# NBT未設定状態にするため、キーを削除する

data remove storage spmob:config rare_mobs[1].nbt_data

tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"準レアモブのNBTデータをクリアしました","color":"white"}]
