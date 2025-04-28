import 'package:flutter/material.dart';
import 'package:get_contact/core/helper/dialog_helper.dart';

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
        appBar: AppBar(title: const Text('SnackBar Demo')),
        body: Builder(
          // <--- Tambahkan ini agar context aman
          builder: (BuildContext context) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  DialogHelper.showErrorSnackbar(
                      context: context,
                      text:
                          'Something went wrong while processing your request.');
                  DialogHelper.showWarningSnackbar(
                      context: context,
                      text: 'Please double-check your input!.');
                  DialogHelper.showSuccessSnackbar(
                      context: context,
                      text: 'Your data has been saved successfully.');
                },
                child: const Text('Show Message'),
              ),
            );
          },
        ),
      ),
    );
  }
}
