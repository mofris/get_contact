import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAppWidget extends StatelessWidget {
  const LoadingAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/img/loading.json'),
    );
  }
}
