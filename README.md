# 定期モブスポーンデータパック

指定した範囲内に定期的にモブをスポーンさせるMinecraftデータパックです。

## 機能

- **範囲指定**: fillコマンドと同様に対角点を指定してスポーン範囲を設定
- **間隔設定**: tick単位でスポーン間隔を指定（デフォルト: 100tick = 5秒）
- **モブ選択**: 文字列でモブタイプを指定（デフォルト: 牛）
- **スポーン数**: 1回のサイクルで湧く数を指定（デフォルト: 5体）
- **確率設定**: 0-100%でスポーン確率を設定（デフォルト: 100%）
- **レアモブシステム**: メインモブに加えて、確率でレアモブをスポーン可能（デフォルト: ムーシュルーム 10%）
- **NBTカスタマイズ**: メイン・レア両方のモブにカスタムNBTタグで属性を詳細設定可能
- **範囲可視化**: デバッグ用にスポーン範囲をパーティクルで表示
- **開始/停止/リセット**: 簡単にシステムを制御

## インストール

1. このフォルダを `%appdata%\.minecraft\saves\<ワールド名>\datapacks\` にコピー
2. ゲーム内で `/reload` を実行
3. 読み込み成功のメッセージが表示されます

## 使い方

### 基本的な使い方

1. **範囲を設定**
   ```
   # 方法1: 現在位置を使用
   /function spmob:command/set_pos1
   ```
   現在位置を第1点として設定
   
   別の場所に移動して:
   ```
   /function spmob:command/set_pos2
   ```
   現在位置を第2点として設定
   
   ```
   # 方法2: 座標を直接指定
   /function spmob:command/set_pos1_at {x:100,y:64,z:200}
   /function spmob:command/set_pos2_at {x:200,y:80,z:300}
   ```

2. **モブを設定（オプション）**
   ```
   /function spmob:command/set_mob {mob:"minecraft:zombie"}
   ```

3. **レアモブを設定（オプション）**
   ```
   /function spmob:command/set_mob_rare {mob:"minecraft:husk"}
   /function spmob:command/set_rare_probability {value:15}
   ```
   ※ 15%の確率でレアモブ（ハスク）がスポーン

4. **スポーン開始**
   ```
   /function spmob:command/start
   ```

5. **スポーン停止**
   ```
   /function spmob:command/stop
   ```

### レアモブシステム

#### レアモブの設定
```
/function spmob:command/set_mob_rare {mob:"minecraft:mooshroom"}
```
通常は牛がスポーンしますが、設定した確率でレアモブがスポーンします。

#### レア出現確率の変更
```
# 整数で設定
/function spmob:command/set_rare_probability {value:20}

# 小数点1桁まで設定可能（10倍して渡す: 15.5% → 155）
/function spmob:command/set_rare_probability {value:155}
```
0.0-100.0%で設定可能（デフォルト: 10.0%）
**小数点1桁を使う場合は10倍した値を指定**（例: 15.5% → `{value:155}`）

#### レアモブのNBT設定
```
# 方法1（推奨・確実）: 直接storageに保存
/data modify storage spmob:config rare_mobs[0].nbt_data set value {CustomName:'{"text":"レア牛"}',Glowing:1b}

# 方法2: マクロ関数を使用（JSON文字列のエスケープに注意）
# シンプルなNBTの場合
/function spmob:command/set_nbt_rare {nbt:{Glowing:1b}}
# CustomNameなどJSON文字列を含む場合は方法1を推奨
```
レアモブにカスタムNBTを適用できます。**JSON文字列（CustomName等）を含む場合は直接storage保存を推奨します。**

**使用例：通常は牛、10%でレアなムーシュルームをスポーン**
```
/function spmob:command/set_mob {mob:"minecraft:cow"}
/function spmob:command/set_mob_rare {mob:"minecraft:mooshroom"}
/function spmob:command/set_rare_probability {value:10}
/function spmob:command/start
```

### 詳細設定

#### スポーン間隔の変更
```
/function spmob:command/set_interval {value:200}
```
200tick（10秒）ごとにスポーン

#### スポーン数の変更
```
/function spmob:command/set_count {value:10}
```
1サイクルで10体スポーン

#### 確率の設定
```
/function spmob:command/set_probability {value:50}
```
50%の確率でスポーン

#### カスタムNBTの設定（メインモブ）
```
# 方法1（推奨・確実）: 直接storageに保存
/data modify storage spmob:config nbt_data_main set value {CustomName:'{"text":"Boss"}',Health:100.0f}

# 方法2: マクロ関数を使用（シンプルなNBTのみ）
/function spmob:command/set_nbt {nbt:{Health:100.0f,Glowing:1b}}
# 注意: CustomNameなどJSON文字列を含む場合は方法1を使用してください
```

#### カスタムNBTの設定（レアモブ）
```
# 方法1（推奨・確実）: 直接storageに保存
/data modify storage spmob:config rare_mobs[0].nbt_data set value {CustomName:'{"text":"レアボス"}',Health:200.0f,Glowing:1b}

# 方法2: マクロ関数を使用（シンプルなNBTのみ）
/function spmob:command/set_nbt_rare {nbt:{Health:200.0f,Glowing:1b}}
# 注意: CustomNameなどJSON文字列を含む場合は方法1を使用してください
```

#### NBTをクリア
```
# メインモブのNBTをクリア
/function spmob:command/clear_nbt

# レアモブのNBTをクリア
/function spmob:command/clear_nbt_rare

# または直接storageから削除（上級者向け）
/data remove storage spmob:config nbt_data_main
/data remove storage spmob:config rare_mobs[0].nbt_data
```

#### 範囲の可視化
```
/function spmob:command/toggle_visual
```
オレンジ色のパーティクルで範囲の辺が表示されます（20tickごとに更新）

#### デバッグログの切替
```
/function spmob:command/toggle_debug
```
スポーンに関する詳細なデバッグログのON/OFFを切り替えます

### リセット
```
/function spmob:command/reset
```
すべての設定をデフォルト値に戻します

### ヘルプ
```
/function spmob:command/help
```
クリック可能なコマンドリストが表示されます

### クイックスタート（上級者向け）

すべての設定をまとめて実行：
```
/function spmob:command/quick_start {x1:0,y1:60,z1:0,x2:50,y2:80,z2:50,mob:"minecraft:cow",interval:200,count:50,rare_mob:"minecraft:mooshroom",rare_prob:100}
```

カスタムプリセット例（編集して使用）：
```
/function spmob:command/preset_custom
```
`preset_custom.mcfunction`ファイルを直接編集して独自の設定を保存できます。

## モブタイプの例

- `minecraft:cow` - 牛
- `minecraft:pig` - 豚
- `minecraft:zombie` - ゾンビ
- `minecraft:skeleton` - スケルトン
- `minecraft:creeper` - クリーパー
- `minecraft:spider` - クモ
- `minecraft:enderman` - エンダーマン
- その他、Minecraftの全モブID

**重要**: CustomNameなどJSONテキストを含むNBTは、直接storageに保存する方法を使用してください。

### 名前付きモブ
```
/data modify storage spmob:config nbt_data_main set value {CustomName:'{"text":"強化ゾンビ","color":"red"}'}
```

### 体力を増やす
```
/data modify storage spmob:config nbt_data_main set value {Health:100.0f,Attributes:[{Id:"minecraft:generic.max_health",Base:100.0}]}
```

### 光るモブ（マクロ関数でもOK）
```
/function spmob:command/set_nbt {nbt:{Glowing:1b}}
```

### 装備付きゾンビ
```
/data modify storage spmob:config nbt_data_main set value {HandItems:[{id:"minecraft:diamond_sword",count:1},{}],ArmorItems:[{id:"minecraft:diamond_boots",count:1},{id:"minecraft:diamond_leggings",count:1},{id:"minecraft:diamond_chestplate",count:1},{id:"minecraft:diamond_helmet",count:1}]}
```

### 複合例：名前付き・光る・体力増加
```
/data modify storage spmob:config nbt_data_main set value {CustomName:'{"text":"ボス","color":"gold","bold":true}',Glowing:1b,Health:200.0f,Attributes:[{Id:"minecraft:generic.max_health",Base:200.0}]
```
/function spmob:command/set_nbt {nbt:{HandItems:[{id:"minecraft:diamond_sword",count:1},{}],ArmorItems:[{id:"minecraft:diamond_boots",count:1},{id:"minecraft:diamond_leggings",count:1},{id:"minecraft:diamond_chestplate",count:1},{id:"minecraft:diamond_helmet",count:1}]}}
```

## 技術情報

- **対応バージョン**: Minecraft 1.21.5以降（pack_format 94.1）
- **名前空間**: `spmob`
- **パフォーマンス**: 
  - UUID乱数生成を使用
  - 可視化は20tickごと
  - 空気ブロックチェックなし（軽量化優先）

## 注意事項

- スポーン範囲が大きすぎるとパフォーマンスに影響する可能性があります
- モブが固体ブロック内にスポーンすると窒息する可能性があります
- 確率設定は各スポーン試行ごとに適用されます（1サイクルで複数体スポーンする場合、各モブが独立して判定）

### 文字化けが発生する場合

すべての `.mcfunction` ファイルは **UTF-8（BOMなし）** で保存されている必要があります。
日本語が文字化けする場合は、[ENCODING.md](ENCODING.md) を参照してエンコーディングを修正してください。

VS Codeでの修正方法：
1. 該当ファイルを開く
2. 右下のエンコーディング表示をクリック
3. 「エンコーディングを指定して保存」を選択
4. 「UTF-8」を選択（BOMなし）

## デバッグモード

モブがスポーンしない場合、デバッグメッセージが有効になっています。
チャットログで以下の情報が確認できます：
- スポーンサイクルの開始/終了
- 各スポーン試行
- 確率判定の結果
- 実際のスポーン座標
- モブタイプ

デバッグメッセージを無効にするには、以下のファイルから `tellraw` 行を削除してください：
- `internal/spawn_attempt.mcfunction`
- `internal/do_spawn.mcfunction`
- `internal/spawn_mob_execute.mcfunction`
- `internal/spawn_cycle.mcfunction`

## ライセンス

自由に使用・改変・再配布できます。

## 作成者

GitHub Copilot (Claude Sonnet 4.5)
