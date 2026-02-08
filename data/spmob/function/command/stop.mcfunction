# モブスポーンを停止

scoreboard players set #global spmob.state.active 0

# カウントダウン表示をクリア
title @a actionbar {"text":""}

tellraw @a [{"text":"[SpMob] ","color":"gold","bold":true},{"text":"モブスポーンを停止しました","color":"red"}]