# データパック初期化処理
# スコアボードオブジェクトの作成

# 座標管理用スコアボード (6個)
scoreboard objectives add spmob.pos.x1 dummy
scoreboard objectives add spmob.pos.y1 dummy
scoreboard objectives add spmob.pos.z1 dummy
scoreboard objectives add spmob.pos.x2 dummy
scoreboard objectives add spmob.pos.y2 dummy
scoreboard objectives add spmob.pos.z2 dummy

# 正規化された範囲用スコアボード (6個)
scoreboard objectives add spmob.pos.min_x dummy
scoreboard objectives add spmob.pos.min_y dummy
scoreboard objectives add spmob.pos.min_z dummy
scoreboard objectives add spmob.pos.max_x dummy
scoreboard objectives add spmob.pos.max_y dummy
scoreboard objectives add spmob.pos.max_z dummy

# 設定用スコアボード (7個)
scoreboard objectives add spmob.config.interval dummy
scoreboard objectives add spmob.config.count dummy
scoreboard objectives add spmob.config.probability dummy
scoreboard objectives add spmob.config.rare_prob dummy
scoreboard objectives add spmob.config.range_x dummy
scoreboard objectives add spmob.config.range_y dummy
scoreboard objectives add spmob.config.range_z dummy

# 状態管理用スコアボード (5個)
scoreboard objectives add spmob.state.active dummy
scoreboard objectives add spmob.state.timer dummy
scoreboard objectives add spmob.state.visual dummy
scoreboard objectives add spmob.state.debug dummy
scoreboard objectives add spmob.state.first_spawn dummy

# 一時計算用スコアボード (4個)
scoreboard objectives add spmob.temp dummy
scoreboard objectives add spmob.temp.spawn_x dummy
scoreboard objectives add spmob.temp.spawn_y dummy
scoreboard objectives add spmob.temp.spawn_z dummy

# ループカウンター用
scoreboard objectives add spmob.temp.counter dummy

# 定数用スコアボード
scoreboard objectives add spmob.const dummy

# デフォルト値の設定
scoreboard players set #global spmob.config.interval 100
scoreboard players set #global spmob.config.count 5
scoreboard players set #global spmob.config.probability 100
scoreboard players set #global spmob.config.rare_prob 100
scoreboard players set #global spmob.state.active 0
scoreboard players set #global spmob.state.timer 0
scoreboard players set #global spmob.state.visual 0
scoreboard players set #global spmob.state.debug 0

# 定数の設定
scoreboard players set #global spmob.const 100
scoreboard players set #10 spmob.const 10
scoreboard players set #20 spmob.const 20
scoreboard players set #1000 spmob.const 1000
scoreboard players set #-1 spmob.const -1

# ストレージの初期化
# メインモブ設定
data modify storage spmob:config mob_type_main set value "minecraft:cow"
# NBT未設定時はキーを作らない（削除して存在しない状態にする）
data remove storage spmob:config nbt_data_main

# レアモブ設定（配列形式で拡張性を確保）
# NBT未設定時はnbt_dataキーを含めない
data modify storage spmob:config rare_mobs set value [{mob_type:"minecraft:mooshroom",probability:10}]

# 後方互換性のため、旧キーもデフォルト設定
data modify storage spmob:config mob_type set value "minecraft:cow"
data remove storage spmob:config nbt_data

# 読み込み完了メッセージ
tellraw @a [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"定期モブスポーンシステムを読み込みました","color":"white","bold":false}]
tellraw @a [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"ヘルプ: ","color":"gray","bold":false},{"text":"/function spmob:command/help","color":"aqua","bold":false,"clickEvent":{"action":"suggest_command","value":"/function spmob:command/help"}}]