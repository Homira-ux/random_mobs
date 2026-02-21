# 準レアモブを削除（マクロ関数）
# ストレージからrare_mobs[1].mob_typeを読み取り、そのタイプのすべてのエンティティをキル

$execute if entity @e[type=$(mob_type)] run tellraw @a [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"準レアモブを削除: ","color":"white"},{"text":"$(mob_type)","color":"yellow"}]
$kill @e[type=$(mob_type)]
