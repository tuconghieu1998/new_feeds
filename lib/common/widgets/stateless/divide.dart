import 'package:flutter/material.dart';

class Divide extends StatelessWidget {
  const Divide({super.key, this.height, this.color});

  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 1,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color ?? Colors.black
      ),
    );
  }
}