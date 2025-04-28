import 'package:flutter/material.dart';
import 'package:get_contact/core/helper/global_helper.dart';
import 'package:lottie/lottie.dart';

class ErrorAppWidget extends StatelessWidget {
  final String description;
  final void Function() onPressDefaultButton;
  final FilledButton? alternatifButton;

  const ErrorAppWidget({
    super.key,
    required this.description,
    required this.onPressDefaultButton,
    this.alternatifButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        width: double.maxFinite,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 150,
            child: Lottie.asset(
              'assets/img/error.json',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: GlobalHelper.getTextStyle(
                context,
                appTextStyle: AppTextStyle.TITLE_MEDIUM,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          alternatifButton ??
              FilledButton.icon(
                onPressed: onPressDefaultButton,
                icon: Icon(Icons.refresh),
                label: Text("Refresh"),
              )
        ]));
  }
}
