import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NetworkErrorAnimation extends StatefulWidget {
  @override
  _NetworkErrorAnimationState createState() => _NetworkErrorAnimationState();
}

class _NetworkErrorAnimationState extends State<NetworkErrorAnimation> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ui.ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: Dialog(
        insetPadding: const EdgeInsets.all(0.0),
        backgroundColor: Colors.white.withOpacity(0.1),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Lottie.asset('assets/animations/network-error.json'),
        ),
      ),
    );
  }
}
