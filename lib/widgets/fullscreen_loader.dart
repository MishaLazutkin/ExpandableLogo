
import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/style.dart';

@immutable
class FullscreenLoader extends StatelessWidget {

  final bool showGrayBackground;

  const FullscreenLoader({this.showGrayBackground = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (showGrayBackground)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Container(color: const Color.fromRGBO(0, 0, 0, 0.3)),
          ),
        const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
          ),
        ),
      ],
    );
  }
}