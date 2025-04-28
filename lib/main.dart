import 'package:flutter/material.dart';
import 'package:get_contact/core/helper/dialog_helper.dart';
import 'package:get_contact/core/widgets/error_app_widget.dart';
import 'package:get_contact/core/widgets/loading_app_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: ErrorAppWidget(
          description:
              'Server Error ad asda sdas d asd as das das dadasdasdas d asd asd asd asd as das dsa d asd as das d asd sad',
          onPressDefaultButton: () => {},
        ),
      ),
    );
  }
}
