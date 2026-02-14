# カスタムプリセット例: 高級牛太郎スポーナー
# この例をコピーして独自のプリセットを作成できます

# 座標範囲を設定（現在位置の周囲50ブロック）
execute at @s run function spmob:command/set_pos1_at {x:~-25,y:~,z:~-25}
execute at @s run function spmob:command/set_pos2_at {x:~25,y:~20,z:~25}

# メインモブ
function spmob:command/set_mob {mob:"minecraft:cow"}
data modify storage spmob:config nbt_data_main set value {CustomName:'{"text":"高級な牛太郎","color":"red"}'}

# レアモブ
function spmob:command/set_mob_rare {mob:"minecraft:mooshroom"}
data modify storage spmob:config rare_mobs[0].nbt_data set value {CustomName:'{"text":"金色の牛太郎","color":"gold"}'}
function spmob:command/set_rare_probability {value:10}

# 準レアモブ
function spmob:command/set_mob_semi_rare {mob:"minecraft:pig"}
data modify storage spmob:config rare_mobs[1].nbt_data set value {CustomName:'{"text":"銀色の豚三郎","color":"gray"}'}
function spmob:command/set_semi_rare_probability {value:15}

# スポーン設定
function spmob:command/set_interval {value:200}
function spmob:command/set_count {value:50}

# 開始
function spmob:command/start

tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"プリセット「高級牛太郎」を適用しました","color":"green"}]
