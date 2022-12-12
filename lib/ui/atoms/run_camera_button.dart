import 'package:camera/camera.dart';
import 'package:coffee_report/state/camera_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RunCameraButton extends ConsumerWidget {
  const RunCameraButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraController = ref.watch(cameraControllerProvider);
    void onPressed() {
      print('camera');
    }

    return Scaffold(
      body: cameraController.when(
          data: (data) => CameraPreview(data),
          error: (err, stack) => Text('Error: $err'),
          loading: () => Center(
                child: CircularProgressIndicator(),
              )),
    );
    // return FloatingActionButton(
    //     tooltip: 'カメラを起動',
    //     onPressed: onPressed,
    //     child: const Icon(Icons.camera_alt));
  }
}
