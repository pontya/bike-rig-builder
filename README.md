# Bike Rig Builder

Maya 用のバイク（モーターサイクル）ゲームリグのビルダー。
ガイド（ロケーター）を置いてビルドすると、激しいアクション（ドリフト、ジャンプ、ウィリー、壁走り…）向けのリグができる。
タイヤの回転は付属のプラグイン `wheelRoll` が移動から自動で計算する。

A guide-based motorcycle game rig builder for Maya, with an automatic wheel-roll plug-in.
Place the guides, press Build, animate with translate / rotate only. Joints are baked for game export.

- Maya 2022 以降（Maya 2027 で検証）、Python 3
- 単位 cm、+Z が前、Y が上、ライダーの左が +X

## 中身

| パス | 内容 |
|---|---|
| `rig/bike_rig.ma` | ビルド済みのリグ（Joint・コントローラー・ガイド） |
| `scripts/bike_rig_builder.py` | ビルダー本体（ガイド作成 / ミラー / ビルド / 削除の UI） |
| `scripts/bike_import_rig.py` | Joint のアニメーションをコントローラーに焼き込む |
| `scripts/export_game_fbx.py` | Joint をベイクして FBX 書き出し |
| `scripts/bike_rig_shapes.json` | 調整済みのコントローラー形状 |
| `plug-ins/wheelRollNode.py` | タイヤ自動回転ノード `wheelRoll`（v0.5） |
| `examples/anim/` | テスト用アクション 8 本を作るスクリプトと自動チェック |
| `tools/` | 2 つのリグが同じ動きをするかの比較（mayapy） |

## インストール

1. `scripts/` の中身をまとめて `ドキュメント/maya/scripts` に置く（同じフォルダに）
2. `plug-ins/wheelRollNode.py` を `ドキュメント/maya/<バージョン>/plug-ins` に置き、プラグインマネージャーで Loaded / Auto load をオン
3. スクリプトエディタ（Python）で

```python
import bike_rig_builder; bike_rig_builder.show()
```

## 使い方

1. **ガイドを作成**：ガイドをバイクの各部に合わせる
   - `frontAxle` / `rearAxle` の `radius` にタイヤ半径、`root` の `tyreProfile` にタイヤ断面の中心の高さ（Drive のバンク中心）
   - レバー・ミラー・ペダル・スタンドの pivot ガイドを回転させると、青い軸（ローカル Z）がヒンジになる
2. **左 → 右にミラー**
3. **ビルド**：駆動用の骨格とコントローラーができる。シーンに `DEFAULT_JOINT_MAP` の名前の Joint があれば、その Joint も動かす

自分の Joint を動かすときは役割ごとに割り当てる（`Builder(mapping={...})`、役割の一覧は `ROLES`）。

### ビルド済みのリグ

`rig/bike_rig.ma` を wheelRoll プラグインを入れて開けば、そのままアニメーションを付けて Joint をベイクできる。
ガイドも入っているので、「リグを削除」→ ガイドを動かす →「ビルド」で作り直せる。
`examples/anim/make_shots.py` の `RIG` にこのファイルを指定すると、テスト用アクションが作れる。

## コントローラー

| コントローラー | チャンネル | 役割 |
|---|---|---|
| Root_ctrl | t / r / sy | 全体の配置・スケール |
| Drive_ctrl | t / r | 走行・向き・バンク。バンクの中心はタイヤ断面の中心 |
| COG_ctrl | t / r | 重心での回転・ジャンプ・宙返り |
| Wheelie_ctrl / Stoppie_ctrl | rx | 後輪軸 / 前輪軸を中心に全体をピッチ |
| Body_ctrl | ty / rx | 車体の沈み込み・ピッチ。荷重のかかったタイヤが接地点に残る |
| Steer_ctrl | rx | ステア |
| Front_WheelBump_ctrl / Rear_WheelBump_ctrl | ty | タイヤの上下。前はフォークに沿って、後ろはスイングアームに垂直 |
| Front_Wheel_ctrl / Rear_Wheel_ctrl | rx / autoRoll | 手付けの回転（自動回転に足される）と自動回転のオン・オフ |
| L/R_Lever_ctrl, L/R_Mirror_ctrl | ry | +で左右とも同じ動き |
| L/R_Pedal_ctrl | rz | |
| Stand_ctrl | rx | |

追加アトリビュートは autoRoll だけ。それ以外はすべて translate / rotate。

## タイヤの自動回転（wheelRoll）

- `autoRoll = 1`：Drive_ctrl の進行方向への移動量から回る。横滑りでは回らない、バックで逆回転
- `autoRoll = 0`：自動の分が止まる（その時点の角度で止まる）。1→0 をなめらかに打てば減速して止まる
- `rx`：手付け。常に自動の分に足される（バーンアウト、ホイールスピン）
- 地上・空中とも基本は 1 のまま。止めたいとき（ブレーキロック）だけ 0
- 回転はキーの変更時に表を作り直し、再生中は表を引くだけ（1 輪 1 フレーム 30µs 程度）

## ゲームへの書き出し

`rootJnt` 以下の Joint をベイクして書き出す（駆動用の骨格 `BikeRig_skel` は書き出さない）。
タイヤの Joint は回転を直結しているので、ベイクしても値が ±180° で飛ばない。

```python
import export_game_fbx
export_game_fbx.export("D:/out/drift.fbx")
```

## 検証

`tools/compare_rigs.py` で、2 つのリグに同じポーズ・同じアクションを与えて Joint の動きを比べられる。
`rig/bike_rig.ma` を「リグを削除」→「ビルド」で作り直した結果は、元と一致（Joint 位置の差は浮動小数点の誤差程度）。

```
mayapy tools/mayapy_run.py tools/compare_rigs.py A.ma B.ma --shots path/to/shots
```

`tools/mayapy_run.py` は、mayapy 終了時に mayaUsd が落ちてクラッシュレポートが出るのを避けるためのラッパー。

## 注意

- `wheelRoll` のノード ID（`0x0007F101`）は Autodesk のローカル用の範囲。他のプラグインと重なったら変更すること
- コントローラーの形状キット（`cs_shape_tools`）は任意。環境変数 `BIKE_RIG_SHAPE_KIT` にフォルダを指定。無ければ内蔵の形状で作る

## ライセンス

MIT（`LICENSE`）
