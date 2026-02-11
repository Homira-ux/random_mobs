# コマンドのヘルプを表示

tellraw @s [{"text":"========================================","color":"gold"}]
tellraw @s [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"定期モブスポーンシステム","color":"white"}]
tellraw @s [{"text":"========================================","color":"gold"}]
tellraw @s ""
tellraw @s [{"text":"📦 データパックについて","color":"green","bold":true}]
tellraw @s [{"text":"  指定したエリア内に定期的にモブをスポーンさせる","color":"white"}]
tellraw @s [{"text":"  システムです。スポーン間隔、確率、NBTなどを","color":"white"}]
tellraw @s [{"text":"  カスタマイズできます。レアモブ機能も搭載。","color":"white"}]
tellraw @s ""
tellraw @s [{"text":"🎮 基本的な使い方","color":"green","bold":true}]
tellraw @s [{"text":"  1. ","color":"gray"},{"text":"set_pos1","color":"aqua"},{"text":" と ","color":"gray"},{"text":"set_pos2","color":"aqua"},{"text":" で範囲を設定","color":"gray"}]
tellraw @s [{"text":"  2. ","color":"gray"},{"text":"set_mob","color":"aqua"},{"text":" でモブの種類を設定","color":"gray"}]
tellraw @s [{"text":"  3. ","color":"gray"},{"text":"set_interval","color":"aqua"},{"text":" などでスポーン設定","color":"gray"}]
tellraw @s [{"text":"  4. ","color":"gray"},{"text":"start","color":"green"},{"text":" でスポーン開始！","color":"gray"}]
tellraw @s ""
tellraw @s [{"text":"📋 コマンド一覧","color":"green","bold":true}]
tellraw @s ""
tellraw @s [{"text":" 座標設定","color":"yellow"}]
tellraw @s [{"text":"  "},{"text":"[第1点設定]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function spmob:command/set_pos1"},"hoverEvent":{"action":"show_text","contents":"クリックしてコマンドを入力"}},{"text":" - 現在位置を第1点として設定","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[第2点設定]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function spmob:command/set_pos2"},"hoverEvent":{"action":"show_text","contents":"クリックしてコマンドを入力"}},{"text":" - 現在位置を第2点として設定","color":"gray"}]

tellraw @s [{"text":" モブ設定","color":"yellow"}]
tellraw @s [{"text":"  "},{"text":"[モブ設定]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function spmob:command/set_mob {mob:\"minecraft:cow\"}"},"hoverEvent":{"action":"show_text","contents":"クリックしてコマンドを編集"}},{"text":" - メインモブを設定","color":"gray"}]
tellraw @s [{"text":"    例: ","color":"gray"},{"text":"/function spmob:command/set_mob {mob:\"minecraft:zombie\"}","color":"white"}]
tellraw @s [{"text":"  "},{"text":"[NBT設定]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function spmob:command/set_nbt {nbt:''}"},"hoverEvent":{"action":"show_text","contents":"クリックしてコマンドを編集"}},{"text":" - メインモブのNBTを設定","color":"gray"}]
tellraw @s [{"text":"    例: ","color":"gray"},{"text":"{nbt:'{CustomName:\"Boss\",Health:100f}'}","color":"white"}]
tellraw @s [{"text":"  "},{"text":"[レアモブ設定]","color":"light_purple","clickEvent":{"action":"suggest_command","value":"/function spmob:command/set_mob_rare {mob:\"minecraft:mooshroom\"}"},"hoverEvent":{"action":"show_text","contents":"クリックしてコマンドを編集"}},{"text":" - レアモブを設定","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[レアNBT設定]","color":"light_purple","clickEvent":{"action":"suggest_command","value":"/function spmob:command/set_nbt_rare {nbt:''}"},"hoverEvent":{"action":"show_text","contents":"クリックしてコマンドを編集"}},{"text":" - レアモブのNBTを設定","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[レア確率設定]","color":"light_purple","clickEvent":{"action":"suggest_command","value":"/function spmob:command/set_rare_probability {value:10}"},"hoverEvent":{"action":"show_text","contents":"クリックしてコマンドを編集"}},{"text":" - レア出現確率(0-100%)を設定","color":"gray"}]

tellraw @s [{"text":" スポーン設定","color":"yellow"}]
tellraw @s [{"text":"  "},{"text":"[間隔設定]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function spmob:command/set_interval {value:100}"},"hoverEvent":{"action":"show_text","contents":"クリックしてコマンドを編集"}},{"text":" - スポーン間隔(tick)を設定","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[数設定]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function spmob:command/set_count {value:5}"},"hoverEvent":{"action":"show_text","contents":"クリックしてコマンドを編集"}},{"text":" - 1回あたりのスポーン数を設定","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[確率設定]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function spmob:command/set_probability {value:100}"},"hoverEvent":{"action":"show_text","contents":"クリックしてコマンドを編集"}},{"text":" - スポーン確率(0-100%)を設定","color":"gray"}]

tellraw @s [{"text":" 制御","color":"yellow"}]
tellraw @s [{"text":"  "},{"text":"[開始]","color":"green","clickEvent":{"action":"suggest_command","value":"/function spmob:command/start"},"hoverEvent":{"action":"show_text","contents":"クリックして実行"}},{"text":" - モブスポーンを開始","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[停止]","color":"red","clickEvent":{"action":"suggest_command","value":"/function spmob:command/stop"},"hoverEvent":{"action":"show_text","contents":"クリックして実行"}},{"text":" - モブスポーンを停止","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[リセット]","color":"gold","clickEvent":{"action":"suggest_command","value":"/function spmob:command/reset"},"hoverEvent":{"action":"show_text","contents":"クリックして実行"}},{"text":" - すべての設定をリセット","color":"gray"}]

tellraw @s [{"text":" その他","color":"yellow"}]
tellraw @s [{"text":"  "},{"text":"[可視化切替]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function spmob:command/toggle_visual"},"hoverEvent":{"action":"show_text","contents":"クリックして実行"}},{"text":" - 範囲の可視化をON/OFF","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[デバッグ切替]","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function spmob:command/toggle_debug"},"hoverEvent":{"action":"show_text","contents":"クリックして実行"}},{"text":" - デバッグログをON/OFF","color":"gray"}]
tellraw @s ""
tellraw @s [{"text":"📖 詳細なコマンドリファレンスは COMMANDS.md を参照","color":"gray","italic":true}]
tellraw @s [{"text":"========================================","color":"gold"}]