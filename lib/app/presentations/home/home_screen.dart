import 'package:flutter/material.dart';
import 'package:get_contact/app/presentations/home/home_notifier.dart';
import 'package:get_contact/core/widgets/app_widget.dart';

class HomeScreen extends AppWidget<HomeNotifier, void, void> {
  @override
  Widget bodyBuild(BuildContext context) {
    return Center(
      child: Text('Halaman Home'),
    );
  }
}
