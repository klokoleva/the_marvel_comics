import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget lottieAsset({bool isSmaller = false, String? jsonName = 'loading'}) {
  return Center(
    child: Lottie.asset(
      'assets/$jsonName.json',
      width: isSmaller ? 50 : 200,
      height: isSmaller ? 50 : 200,
    ),
  );
}
