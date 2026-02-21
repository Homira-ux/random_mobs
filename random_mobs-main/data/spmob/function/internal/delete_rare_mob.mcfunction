# レアモブを削除（マクロ関数）
# ストレージからrare_mobs[0].mob_typeを読み取り、そのタイプのすべてのエンティティをキル

$execute if entity @e[type=$(mob_type)] run tellraw @a [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"レアモブを削除: ","color":"white"},{"text":"$(mob_type)","color":"light_purple"}]
$kill @e[type=$(mob_type)]
