# Changelog

## 2.0
- 単位を cm に（ガイドの既定位置・コントローラーの大きさも cm）
- WheelLift → WheelBump。前輪の ty はフォークに沿ってスライド、後輪の ty はスイングアームに垂直。コントローラーの Y もその向き
- 名前：前後は Front_ / Rear_（例 `Front_Wheel_ctrl`, `Rear_wheelRoll`）。L_ / R_ は左右だけ
- Drive_ctrl の回転順序を xyz に
- パーツのチャンネル：レバー / ミラー = ry、ペダル = rz、スタンド = rx
- コンストレイントを `RigSystem|Constraints` にまとめる
- タイヤの Joint には回転を直結（ベイクしても ±180° で値が飛ばない）
- wheelRoll 0.5 の設定（poseRoll、Drive_ctrl を進行方向に使う）
- 「リグを削除」ボタン（動かしていた Joint をレストの値に戻す）、ビルドのログ表示
- `rig/bike_rig.ma`：ビルド済みのリグ
- Bike Import Rig：名前を 2.0 に合わせ、WheelBump の探索範囲を単位に依存しない大きさに
- `tools/compare_rigs.py`：2 つのリグの動きの比較

## wheelRollNode 0.5
- airInertia を削除（古いシーンが読めるよう、非表示で何もしないアトリビュートとして残す）
- autoRoll を区間の中点でサンプル：ステップキーがそのフレームでぴったり切り替わる
- 保存済みの表が有効なら開いたときに作り直さない。`wheelRollStatus` コマンド

## 1.0
- ガイドからリグを作るビルダー、Bike Import Rig
