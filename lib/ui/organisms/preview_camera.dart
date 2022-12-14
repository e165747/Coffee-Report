import 'package:camera/camera.dart';
import 'package:coffee_report/state/camera_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PreviewCamera extends ConsumerWidget {
  const PreviewCamera({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraController = ref.watch(cameraControllerProvider);

    return SizedBox(
      child: cameraController.when(
          data: (data) => CameraPreview(data),
          error: (err, stack) => Text('Error: $err'),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
