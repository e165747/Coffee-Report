import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RunCameraButton extends ConsumerWidget {
  const RunCameraButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onPressed() {
      print('camera');
      Navigator.of(context).pushNamed('/camera-view');
    }

    return FloatingActionButton(
        tooltip: 'カメラを起動',
        onPressed: onPressed,
        child: const Icon(Icons.camera_alt));
  }
}
