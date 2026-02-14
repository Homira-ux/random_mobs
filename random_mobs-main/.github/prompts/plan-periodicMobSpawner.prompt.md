# Plan: 定期モブスポーンデータパック

Minecraftデータパックで、指定範囲内に定期的にモブをスポーンさせるシステムを実装します。文字列ベースのモブ指定とストレージマクロを活用し、NBTカスタマイズと可視化トグル機能を持つ柔軟な設計とします。

## Steps

1. **初期化システム** - [data/spmob/function/system/load.mcfunction](data/spmob/function/system/load.mcfunction) 作成
   - 11個のスコアボードオブジェクト作成（`spmob.pos.*`, `spmob.config.*`, `spmob.state.*`, `spmob.temp`, `spmob.const`）
   - デフォルト値設定（interval=100, count=5, probability=100, mob_type="minecraft:cow", nbt=""）
   - ストレージ `spmob:config` 初期化
   - 読み込み完了メッセージ表示

2. **Tickシステム** - [data/spmob/function/system/tick.mcfunction](data/spmob/function/system/tick.mcfunction) 作成
   - `spmob.state.active` が1の時のみ実行
   - タイマー `spmob.state.timer` をインクリメント
   - タイマーが `spmob.config.interval` に到達したらスポーンサイクル実行
   - 可視化が有効な場合、範囲表示処理を実行

3. **座標設定コマンド** - [data/spmob/function/command/set_pos1.mcfunction](data/spmob/function/command/set_pos1.mcfunction), [set_pos2.mcfunction](data/spmob/function/command/set_pos2.mcfunction) 作成
   - 実行者の座標を `execute store result score` で取得し `spmob.pos.x1/y1/z1` または `x2/y2/z2` に格納
   - 座標設定後、[internal/normalize_range.mcfunction](data/spmob/function/internal/normalize_range.mcfunction) を呼び出して min/max を計算
   - 確認メッセージ表示（座標値と範囲サイズ）

4. **範囲正規化処理** - [data/spmob/function/internal/normalize_range.mcfunction](data/spmob/function/internal/normalize_range.mcfunction) 作成
   - 各軸（x, y, z）について `pos.x1` と `pos.x2` を比較
   - 小さい方を `pos.min_x`、大きい方を `pos.max_x` に設定
   - 範囲サイズ（max - min）を計算して `spmob.config.range_x/y/z` に保存

5. **基本設定コマンド** - 以下の4ファイル作成
   - [command/set_interval.mcfunction](data/spmob/function/command/set_interval.mcfunction): マクロで引数を受け取り `spmob.config.interval` に設定
   - [command/set_count.mcfunction](data/spmob/function/command/set_count.mcfunction): マクロで引数を受け取り `spmob.config.count` に設定
   - [command/set_probability.mcfunction](data/spmob/function/command/set_probability.mcfunction): マクロで引数（0-100）を受け取り設定、範囲外は警告
   - [command/set_mob.mcfunction](data/spmob/function/command/set_mob.mcfunction): マクロで文字列引数を受け取り `storage spmob:config mob_type` に保存

6. **NBT設定コマンド** - [command/set_nbt.mcfunction](data/spmob/function/command/set_nbt.mcfunction) 作成
   - マクロで文字列引数を受け取り `storage spmob:config nbt_data` に保存
   - 例: `{CustomName:'{"text":"Boss"}',Health:100f,Attributes:[{Id:"generic.max_health",Base:100}]}`
   - 無効なNBTの警告は行わない（Minecraft側でエラー表示）

7. **開始/停止/リセットコマンド** - 3ファイル作成
   - [command/start.mcfunction](data/spmob/function/command/start.mcfunction): `spmob.state.active` を1に設定、タイマーを0にリセット
   - [command/stop.mcfunction](data/spmob/function/command/stop.mcfunction): `spmob.state.active` を0に設定
   - [command/reset.mcfunction](data/spmob/function/command/reset.mcfunction): すべての設定を `load.mcfunction` と同じデフォルト値に戻す

8. **スポーンサイクル処理** - [internal/spawn_cycle.mcfunction](data/spmob/function/internal/spawn_cycle.mcfunction) 作成
   - タイマーをリセット
   - `spmob.config.count` 回ループで[internal/spawn_attempt.mcfunction](data/spmob/function/internal/spawn_attempt.mcfunction) を呼び出し
   - ループは関数の再帰呼び出しで実装（カウンターを使用）

9. **スポーン試行処理** - [internal/spawn_attempt.mcfunction](data/spmob/function/internal/spawn_attempt.mcfunction) 作成
   - 確率判定: UUIDベースの乱数生成（marker召喚）で0-99の乱数を取得
   - `spmob.config.probability` と比較、成功時のみスポーン実行
   - [internal/random_pos.mcfunction](data/spmob/function/internal/random_pos.mcfunction) 呼び出しでランダム座標生成
   - [internal/spawn_mob.mcfunction](data/spmob/function/internal/spawn_mob.mcfunction) をマクロで呼び出し

10. **ランダム座標生成** - [internal/random_pos.mcfunction](data/spmob/function/internal/random_pos.mcfunction) 作成
    - 各軸（x, y, z）について：
      - marker召喚してUUID乱数取得
      - `spmob.config.range_x` で剰余演算
      - `spmob.pos.min_x` を加算
      - 結果を `spmob.temp.spawn_x/y/z` に保存
    - 一時markerを削除

11. **モブスポーン実行** - [internal/spawn_mob.mcfunction](data/spmob/function/internal/spawn_mob.mcfunction) 作成（マクロ関数）
    - ストレージから `mob_type` と `nbt_data` を読み込み
    - `execute positioned` で `spmob.temp.spawn_x/y/z` の位置に移動
    - `$summon $(mob_type) ~ ~ ~ $(nbt_data)` でマクロ展開してスポーン
    - 空気ブロックチェックは行わない（軽量化優先）

12. **範囲可視化機能** - 2ファイル作成
    - [command/toggle_visual.mcfunction](data/spmob/function/command/toggle_visual.mcfunction): `spmob.state.visual` を0⇔1トグル
    - [internal/visualize.mcfunction](data/spmob/function/internal/visualize.mcfunction): `particle dust{color:[1.0,0.5,0.0],scale:0.75}` で範囲の12辺を描画（各辺10パーティクル、20tickごとに実行）

13. **ヘルプコマンド** - [command/help.mcfunction](data/spmob/function/command/help.mcfunction) 作成
    - 各コマンドの使用方法をtellrawで表示
      - `/function spmob:command/set_pos1` - 第1点設定
      - `/function spmob:command/set_pos2` - 第2点設定
      - `/function spmob:command/set_mob with {mob:"<type>"}` - モブ指定
      - `/function spmob:command/set_nbt with {nbt:'<nbt>'}` - NBT設定
      - `/function spmob:command/set_interval with {value:<tick>}` - 間隔設定
      - `/function spmob:command/set_count with {value:<num>}` - 数設定
      - `/function spmob:command/set_probability with {value:<0-100>}` - 確率設定
      - `/function spmob:command/start` - 開始
      - `/function spmob:command/stop` - 停止
      - `/function spmob:command/reset` - リセット
      - `/function spmob:command/toggle_visual` - 可視化切り替え
    - クリック可能なJSON形式で表示

## Verification

1. データパック読み込み: `/reload` 実行後、チャットにロード成功メッセージが表示される
2. 基本動作テスト:
   ```
   /function spmob:command/set_pos1
   /tp ~10 ~5 ~10
   /function spmob:command/set_pos2
   /function spmob:command/set_mob with {mob:"minecraft:pig"}
   /function spmob:command/start
   ```
   - 100tick後に範囲内に豚が5体スポーンすることを確認
3. カスタムNBTテスト:
   ```
   /function spmob:command/set_nbt with {nbt:'{CustomName:\'{"text":"Test"}\',Glowing:1b}'}
   ```
   - 光るカスタム名モブがスポーンすることを確認
4. 可視化テスト: `/function spmob:command/toggle_visual` でオレンジのパーティクルが範囲の辺に表示される
5. 確率テスト: `/function spmob:command/set_probability with {value:50}` で約半数のスポーンサイクルでモブが湧くことを確認

## Decisions

- **マクロ採用**: Minecraft 1.20.5以降のマクロ機能を活用し、文字列ベースのモブ/NBT指定を実現（pack_format 94.1で対応済み）
- **UUID乱数**: spreadplayersやloot tableより軽量で、十分な品質の乱数を提供
- **空気チェック省略**: パフォーマンス優先。ユーザーが有効な範囲を設定する責任を持つ
- **単一範囲**: 複数範囲管理の複雑性を避け、1つの範囲に集中（将来拡張可能な設計）
- **可視化の間隔実行**: 毎tickではなく20tickごとに描画してパフォーマンス影響を最小化
