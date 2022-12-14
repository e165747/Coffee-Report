import 'package:coffee_report/ui/atoms/run_camera_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CoffeePicture extends ConsumerWidget {
  const CoffeePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.bottomRight,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: RunCameraButton(),
      ),
    );
  }
}
