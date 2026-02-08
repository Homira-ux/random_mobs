# 定期モブスポーンシステム - コマンドリファレンス

このドキュメントでは、定期モブスポーンデータパックで使用できるすべてのコマンドの詳細な使い方を説明します。

## 目次
1. [座標設定](#座標設定)
2. [モブ設定](#モブ設定)
3. [スポーン設定](#スポーン設定)
4. [制御コマンド](#制御コマンド)
5. [デバッグ](#デバッグ)
6. [ヘルプ](#ヘルプ)

---

## 座標設定

### set_pos1 - 第1点の設定
スポーン範囲の第1点（対角点の1つ目）を現在位置に設定します。

**コマンド:**
```
/function spmob:command/set_pos1
```

**説明:**
- 実行者の現在位置（X, Y, Z座標）を第1点として記録します
- fillコマンドと同様に、第2点と組み合わせて範囲を決定します
- 座標は整数値に丸められます

**使用例:**
```
# スポーン範囲の開始点に立つ
/function spmob:command/set_pos1
# チャットに設定された座標が表示されます
```

---

### set_pos2 - 第2点の設定
スポーン範囲の第2点（対角点の2つ目）を現在位置に設定します。

**コマンド:**
```
/function spmob:command/set_pos2
```

**説明:**
- 実行者の現在位置（X, Y, Z座標）を第2点として記録します
- 第1点との間の直方体領域がスポーン範囲になります
- 座標の大小関係は自動で正規化されます（x1 > x2 でも問題なし）

**使用例:**
```
# 範囲設定の完全な流れ
/function spmob:command/set_pos1
/tp ~10 ~5 ~10
/function spmob:command/set_pos2
# 10x5x10ブロックの範囲が設定されます
```

**注意:**
- 範囲が広すぎるとパフォーマンスに影響する可能性があります
- 同じ座標を指定すると、その1点にのみスポーンします（範囲0）

---

## モブ設定

### set_mob - スポーンするモブの指定
スポーンさせるモブの種類を設定します。

**コマンド:**
```
/function spmob:command/set_mob {mob:"<モブID>"}
```

**パラメータ:**
- `mob` (文字列, 必須): スポーンさせるモブのID

**使用例:**
```
# 牛をスポーン（デフォルト）
/function spmob:command/set_mob {mob:"minecraft:cow"}

# ゾンビをスポーン
/function spmob:command/set_mob {mob:"minecraft:zombie"}

# 豚をスポーン（minecraft:プレフィックスは省略可能）
/function spmob:command/set_mob {mob:"pig"}

# エンダーマンをスポーン
/function spmob:command/set_mob {mob:"minecraft:enderman"}
```

**利用可能なモブID一覧:**
- `minecraft:cow` - 牛
- `minecraft:pig` - 豚
- `minecraft:sheep`` - 羊
- `minecraft:chicken` - 鶏
- `minecraft:zombie` - ゾンビ
- `minecraft:skeleton` - スケルトン
- `minecraft:creeper` - クリーパー
- `minecraft:spider` - クモ
- `minecraft:enderman` - エンダーマン
- `minecraft:witch` - ウィッチ
- `minecraft:blaze` - ブレイズ
- `minecraft:slime` - スライム
- その他、Minecraftの全モブに対応

**注意:**
- 無効なモブIDを指定するとエラーが発生します
- 一部のモブは特定の環境でないとスポーンできません（例: エンダードラゴン）

---

### set_nbt - カスタムNBTタグの設定
スポーンするモブにカスタムNBTタグを適用します。

**コマンド:**
```
/function spmob:command/set_nbt {nbt:'<NBTタグ>'}
```

**パラメータ:**
- `nbt` (文字列, 必須): モブに適用するNBTタグ（JSON形式）
- 空文字列 `""` を指定するとNBTをクリアします

**使用例:**

#### カスタム名を設定
```
/function spmob:command/set_nbt {nbt:'{CustomName:"{\\"text\\":\\"強化モブ\\",\\"color\\":\\"red\\"}"}'}
```

#### 体力を増加
```
/function spmob:command/set_nbt {nbt:'{Health:100f,Attributes:[{Id:"generic.max_health",Base:100}]}'}
```

#### 光るモブ
```
/function spmob:command/set_nbt {nbt:'{Glowing:1b}'}
```

#### 複数の属性を組み合わせ
```
/function spmob:command/set_nbt {nbt:'{CustomName:"{\\"text\\":\\"ボス\\"}",Health:200f,Glowing:1b}'}
```

#### 装備を持ったゾンビ
```
/function spmob:command/set_nbt {nbt:'{HandItems:[{id:"minecraft:diamond_sword",count:1},{}],ArmorItems:[{id:"minecraft:diamond_boots",count:1},{id:"minecraft:diamond_leggings",count:1},{id:"minecraft:diamond_chestplate",count:1},{id:"minecraft:diamond_helmet",count:1}]}'}
```

#### NBTをクリア
```
/function spmob:command/set_nbt {nbt:''}
```

**注意:**
- NBT構文のエラーはMinecraft側で検出されます
- エスケープ文字（`\"`）に注意してください
- 複雑なNBTはテストしてから使用することを推奨します

---

### set_mob_rare - レアモブの種類を設定
確率で出現するレアモブの種類を設定します。

**コマンド:**
```
/function spmob:command/set_mob_rare {mob:"<モブID>"}
```

**パラメータ:**
- `mob` (文字列, 必須): レアモブとしてスポーンさせるモブのID

**デフォルト値:** `minecraft:mooshroom`（ムーシュルーム）

**使用例:**
```
# ムーシュルームをレアモブに（デフォルト）
/function spmob:command/set_mob_rare {mob:"minecraft:mooshroom"}

# ウィザースケルトンをレアモブに
/function spmob:command/set_mob_rare {mob:"minecraft:wither_skeleton"}

# ピグリンブルートをレアモブに
/function spmob:command/set_mob_rare {mob:"minecraft:piglin_brute"}
```

**説明:**
- メインモブ（`set_mob`で設定）とは別に、レア枠として出現するモブを設定します
- レア確率（`set_rare_probability`）に基づいて、メインモブの代わりにスポーンします
- 通常モブとレアモブで異なるNBTを設定できます

---

### set_nbt_rare - レアモブのNBTタグを設定
レアモブに適用するカスタムNBTタグを設定します。

**コマンド:**
```
/function spmob:command/set_nbt_rare {nbt:'<NBTタグ>'}
```

**パラメータ:**
- `nbt` (文字列, 必須): レアモブに適用するNBTタグ（JSON形式）
- 空文字列 `""` を指定するとNBTをクリアします

**デフォルト値:** 空文字列（NBTなし）

**使用例:**

#### レアモブに光とカスタム名を付与
```
/function spmob:command/set_nbt_rare {nbt:'{CustomName:"{\\"text\\":\\"レアモブ\\",\\"color\\":\\"gold\\"}",Glowing:1b}'}
```

#### レアモブの体力を大幅強化
```
/function spmob:command/set_nbt_rare {nbt:'{Health:300f,Attributes:[{Id:"generic.max_health",Base:300}]}'}
```

#### NBTをクリア
```
/function spmob:command/set_nbt_rare {nbt:''}
```

**使用例 - 通常と強化版の組み合わせ:**
```
# 通常のゾンビ設定
/function spmob:command/set_mob {mob:"minecraft:zombie"}
/function spmob:command/set_nbt {nbt:''}

# レア枠は強化されたゾンビ
/function spmob:command/set_mob_rare {mob:"minecraft:zombie"}
/function spmob:command/set_nbt_rare {nbt:'{CustomName:"{\\"text\\":\\"強化ゾンビ\\",\\"color\\":\\"red\\"}",Health:100f,Glowing:1b}'}
/function spmob:command/set_rare_probability {value:15}
```

---

### set_rare_probability - レア出現確率の設定
レアモブが出現する確率を設定します。

**コマンド:**
```
/function spmob:command/set_rare_probability {value:<0-100>}
```

**パラメータ:**
- `value` (整数, 必須): レア出現確率（0-100%）
- 範囲外の値は自動的に0または100に補正されます

**デフォルト値:** 10%

**使用例:**
```
# 10%の確率でレア（デフォルト）
/function spmob:command/set_rare_probability {value:10}

# 5%の確率でレア（より希少）
/function spmob:command/set_rare_probability {value:5}

# 25%の確率でレア（かなり頻繁）
/function spmob:command/set_rare_probability {value:25}

# 50%の確率でレア（半々）
/function spmob:command/set_rare_probability {value:50}

# レアを完全に無効化
/function spmob:command/set_rare_probability {value:0}

# 常にレア（メインモブは出現しない）
/function spmob:command/set_rare_probability {value:100}
```

**説明:**
- この確率は、スポーンが成功した後に判定されます
- `set_probability`で設定したスポーン確率とは独立しています
- 例：`probability=50`, `rare_prob=10`の場合
  - 50%の確率でスポーン試行が成功
  - 成功したうち10%がレアモブ、90%が通常モブ
  - つまり全体の5%がレア、45%が通常モブがスポーンする

---

## スポーン設定

### set_interval - スポーン間隔の設定
モブがスポーンする間隔をtick単位で設定します。

**コマンド:**
```
/function spmob:command/set_interval {value:<tick数>}
```

**パラメータ:**
- `value` (整数, 必須): スポーン間隔（tick）。1秒 = 20tick

**デフォルト値:** 100tick（5秒）

**使用例:**
```
# 5秒ごと（デフォルト）
/function spmob:command/set_interval {value:100}

# 1秒ごと
/function spmob:command/set_interval {value:20}

# 10秒ごと
/function spmob:command/set_interval {value:200}

# 30秒ごと
/function spmob:command/set_interval {value:600}

# 1分ごと
/function spmob:command/set_interval {value:1200}
```

**推奨値:**
- 最小: 20tick（過度なスポーンを避けるため）
- 最大: 制限なし（用途に応じて）

---

### set_count - 1回のスポーン数
1スポーンサイクルあたりに湧くモブの数を設定します。

**コマンド:**
```
/function spmob:command/set_count {value:<数>}
```

**パラメータ:**
- `value` (整数, 必須): 1サイクルでスポーンするモブの数

**デフォルト値:** 5体

**使用例:**
```
# 5体ずつ（デフォルト）
/function spmob:command/set_count {value:5}

# 1体ずつ
/function spmob:command/set_count {value:1}

# 10体ずつ
/function spmob:command/set_count {value:10}

# 大量スポーン（注意）
/function spmob:command/set_count {value:50}
```

**注意:**
- 数が多すぎるとパフォーマンスに影響します
- 確率設定と組み合わせると実際のスポーン数は変動します

---

### set_probability - スポーン確率の設定
各スポーン試行が成功する確率を設定します。

**コマンド:**
```
/function spmob:command/set_probability {value:<0-100>}
```

**パラメータ:**
- `value` (整数, 必須): スポーン確率（0?100%）
- 範囲外の値は自動的に0または100に補正されます

**デフォルト値:** 100%（必ずスポーン）

**使用例:**
```
# 100%（デフォルト、必ずスポーン）
/function spmob:command/set_probability {value:100}

# 50%（半分の確率でスポーン）
/function spmob:command/set_probability {value:50}

# 25%（4回に1回スポーン）
/function spmob:command/set_probability {value:25}

# 10%（低確率）
/function spmob:command/set_probability {value:10}

# 1%（レアスポーン）
/function spmob:command/set_probability {value:1}

# 0%（スポーンしない）
/function spmob:command/set_probability {value:0}
```

**注意:**
- 確率は各スポーン試行ごとに独立して判定されます
- set_countが5で確率が50%の場合、平均2?3体がスポーンします

---

## 制御コマンド

### start - スポーン開始
モブの定期スポーンを開始します。

**コマンド:**
```
/function spmob:command/start
```

**説明:**
- スポーンシステムをアクティブ化します
- タイマーがリセットされ、設定された間隔でスポーンが開始されます
- すでに開始している場合は、タイマーのみリセットされます

**使用例:**
```
# 基本的な流れ
/function spmob:command/set_pos1
(移動)
/function spmob:command/set_pos2
/function spmob:command/set_mob {mob:"minecraft:zombie"}
/function spmob:command/start
```

**注意:**
- 範囲を設定せずに開始すると、座標(0,0,0)にスポーンします
- 開始するとtickごとにシステムが動作します

---

### stop - スポーン停止
モブの定期スポーンを停止します。

**コマンド:**
```
/function spmob:command/stop
```

**説明:**
- スポーンシステムを非アクティブ化します
- 設定はそのまま保持されます
- 再度startを実行すると再開できます

**使用例:**
```
# スポーンを一時停止
/function spmob:command/stop

# 設定変更後に再開
/function spmob:command/set_interval {value:200}
/function spmob:command/start
```

---

### reset - 設定のリセット
すべての設定をデフォルト値に戻します。

**コマンド:**
```
/function spmob:command/reset
```

**説明:**
- スポーンを停止します
- 以下の設定がデフォルト値にリセットされます:
  - スポーン間隔: 100tick
  - スポーン数: 5体
  - 確率: 100%
  - モブタイプ: minecraft:cow
  - NBTタグ: なし
  - 座標: 0,0,0
  - 範囲: 1x1x1
  - 可視化: OFF

**使用例:**
```
# すべてやり直したい場合
/function spmob:command/reset

# その後、新しい設定を行う
/function spmob:command/set_pos1
...
```

---

## デバッグ

### toggle_visual - 範囲可視化の切り替え
スポーン範囲をパーティクルで表示/非表示を切り替えます。

**コマンド:**
```
/function spmob:command/toggle_visual
```

**説明:**
- 範囲の12辺（直方体の辺）をオレンジ色のパーティクルで表示します
- 実行するたびにON/OFFが切り替わります
- 20tickごとにパーティクルが更新されます

**使用例:**
```
# 範囲を確認したい場合
/function spmob:command/toggle_visual  # ON
# 範囲を目視確認
/function spmob:command/toggle_visual  # OFF
```

**パーティクルの仕様:**
- 色: オレンジ（RGB: 1.0, 0.5, 0.0）
- サイズ: 0.75
- 更新頻度: 20tickごと（1秒ごと）
- 表示タイミング: tickシステムに依存

**注意:**
- パーティクル表示は軽微ですが、常時ONにするとわずかにパフォーマンスに影響します
- 範囲が大きすぎると見づらくなります

---

### toggle_debug - デバッグログの切替
スポーン処理に関する詳細なデバッグログの表示をON/OFFします。

**コマンド:**
```
/function spmob:command/toggle_debug
```

**説明:**
- デバッグログを有効にすると、モブスポーン時に詳細な情報がチャットに表示されます
- 実行するたびにON/OFFが切り替わります
- モブがスポーンしない場合の問題特定に役立ちます

**表示されるデバッグ情報:**
- スポーンサイクルの開始/終了
- 各スポーン試行の確率判定
- 生成された座標
- モブタイプとNBTデータ
- summonコマンドの実行確認

**使用例:**
```
# デバッグモードをON
/function spmob:command/toggle_debug

# モブがスポーンするか確認
/function spmob:command/start

# 確認後、デバッグモードをOFF
/function spmob:command/toggle_debug
```

**デバッグログの例:**
```
[DEBUG] ===== Spawn Cycle Start =====
[DEBUG] Count: 5
[DEBUG] Spawn attempt
[DEBUG] Random: 47 / Probability: 100
[DEBUG] Executing spawn
[DEBUG] Spawn at: -1, -60, -2
[DEBUG] Mob type: minecraft:cow
[DEBUG] spawn_mob_execute CALLED
[DEBUG] Summoning mob: minecraft:cow at -1 -60 -2
[DEBUG] Spawn command executed
[DEBUG] ===== Spawn Cycle End =====
```

**注意:**
- デバッグログはチャットを埋めるため、通常は不要な時はOFFにしてください
- スポーン数が多い場合、大量のログが流れます

---

## ヘルプ

### help - ヘルプメッセージの表示
すべてのコマンドの一覧と簡単な説明を表示します。

**コマンド:**
```
/function spmob:command/help
```

**説明:**
- チャットにクリック可能なコマンドリストが表示されます
- 各コマンドをクリックすると、そのコマンドが入力欄に挿入されます
- ゲーム内で素早くコマンドを確認したい場合に便利です

**使用例:**
```
# データパック読み込み後にすぐ確認
/function spmob:command/help
```

---

## 実用例

### 例1: 基本的なモブファーム
```
# 範囲設定
/function spmob:command/set_pos1
/tp ~10 ~ ~10
/function spmob:command/set_pos2

# 豚を10秒ごとに3体スポーン
/function spmob:command/set_mob {mob:"minecraft:pig"}
/function spmob:command/set_interval {value:200}
/function spmob:command/set_count {value:3}

# 開始
/function spmob:command/start
```

### 例2: レアボスのスポーン
```
# ボスゾンビを1分ごとに1体、10%の確率でスポーン
/function spmob:command/set_mob {mob:"minecraft:zombie"}
/function spmob:command/set_nbt {nbt:'{CustomName:"{\\"text\\":\\"ボス\\",\\"color\\":\\"red\\"}",Health:200f,Attributes:[{Id:"generic.max_health",Base:200}],Glowing:1b}'}
/function spmob:command/set_interval {value:1200}
/function spmob:command/set_count {value:1}
/function spmob:command/set_probability {value:10}
/function spmob:command/start
```

### 例3: 大量スポーン
```
# ゾンビを5秒ごとに20体スポーン
/function spmob:command/set_mob {mob:"minecraft:zombie"}
/function spmob:command/set_interval {value:100}
/function spmob:command/set_count {value:20}
/function spmob:command/start
```

### 例4: カスタムモブのバラエティ
```
# 装備を持ったスケルトンを30秒ごとにスポーン
/function spmob:command/set_mob {mob:"minecraft:skeleton"}
/function spmob:command/set_nbt {nbt:'{HandItems:[{id:"minecraft:bow",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:power":5}}}}],ArmorItems:[{},{},{id:"minecraft:chainmail_chestplate",count:1},{}]}'}
/function spmob:command/set_interval {value:600}
/function spmob:command/start
```

### 例5: レアモブシステム - 通常とレアの2種類
```
# 通常は牛、10%の確率でムーシュルームがスポーン
/function spmob:command/set_mob {mob:"minecraft:cow"}
/function spmob:command/set_mob_rare {mob:"minecraft:mooshroom"}
/function spmob:command/set_rare_probability {value:10}
/function spmob:command/set_interval {value:100}
/function spmob:command/set_count {value:5}
/function spmob:command/start
```

### 例6: レアモブシステム - 強化版ボス
```
# 90%が通常のゾンビ、10%が強化版のボスゾンビ
/function spmob:command/set_mob {mob:"minecraft:zombie"}
/function spmob:command/set_nbt {nbt:''}

/function spmob:command/set_mob_rare {mob:"minecraft:zombie"}
/function spmob:command/set_nbt_rare {nbt:'{CustomName:"{\\"text\\":\\"強化ボス\\",\\"color\\":\\"gold\\"}",Health:300f,Attributes:[{Id:"generic.max_health",Base:300},{Id:"generic.armor",Base:10}],Glowing:1b}'}
/function spmob:command/set_rare_probability {value:10}

/function spmob:command/set_interval {value:200}
/function spmob:command/set_count {value:3}
/function spmob:command/start
```

### 例7: 超レアなイベント
```
# 95%が普通の羊、5%がレアなピンクの羊
/function spmob:command/set_mob {mob:"minecraft:sheep"}
/function spmob:command/set_mob_rare {mob:"minecraft:sheep"}
/function spmob:command/set_nbt_rare {nbt:'{Color:6b,CustomName:"{\\"text\\":\\"レアな羊\\",\\"color\\":\\"light_purple\\"}"}'}
/function spmob:command/set_rare_probability {value:5}
/function spmob:command/start
```

---

## トラブルシューティング

### モブがスポーンしない場合
1. `/function spmob:command/toggle_debug` でデバッグログを有効にして原因を確認
2. `/function spmob:command/start` を実行したか確認
3. 範囲が正しく設定されているか確認（`toggle_visual` で可視化）
4. 確率設定が0%になっていないか確認
5. モブIDが正しいか確認
6. NBTタグに構文エラーがないか確認

### パーティクルが表示されない場合
1. `toggle_visual` を実行しているか確認
2. 範囲が正しく設定されているか確認
3. パーティクル設定がONになっているか確認（ゲーム設定）

### パフォーマンスが悪い場合
1. スポーン間隔を長くする（`set_interval`）
2. 1回のスポーン数を減らす（`set_count`）
3. 範囲を小さくする
4. 可視化をOFFにする

---

## システム情報

- **対応バージョン**: Minecraft 1.21以降
- **名前空間**: `spmob`
- **スコアボードオブジェクト**: 27個
- **ストレージ**: `spmob:config`, `spmob:temp`, `spmob:visual`

---

## 関連ファイル
- [README.md](README.md) - 概要とインストール方法
- [pack.mcmeta](pack.mcmeta) - データパックメタデータ
