import 'package:camera/camera.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// カメラ用コントローラー状態を制御
final cameraControllerProvider =
    FutureProvider.autoDispose<CameraController>((ref) async {
  // 引用
  // https://qiita.com/pikatyu3/items/fedfa27ab889b0d07b37
  // 利用可能なカメラの一覧を取得
  final cameras = await availableCameras();
  // 内カメをセット　※0: 外カメ　1: 内カメ
  print(cameras);
  final camera = cameras[0];
  final controller = CameraController(
    camera,
    ResolutionPreset.medium,
  );
  // プロバイダーの破棄時にカメラコントローラを破棄する
  ref.onDispose(() {
    controller.dispose();
  });

  // コントローラを初期化
  await controller.initialize();
  return controller;
});
