import 'package:coffee_report/ui/organisms/preview_camera.dart';
import 'package:coffee_report/ui/templates/main_template.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CameraView extends ConsumerWidget {
  const CameraView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainTemplate(title: 'camera', body: PreviewCamera());
  }
}
