# メインモブを削除（マクロ関数）
# ストレージからmob_type_mainを読み取り、そのタイプのすべてのエンティティをキル

$execute if entity @e[type=$(mob_type_main)] run tellraw @a [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"メインモブを削除: ","color":"white"},{"text":"$(mob_type_main)","color":"aqua"}]
$kill @e[type=$(mob_type_main)]
