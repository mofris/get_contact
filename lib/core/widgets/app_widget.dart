import 'package:flutter/material.dart';
import 'package:get_contact/core/di/dependency.dart';
import 'package:get_contact/core/helper/dialog_helper.dart';
import 'package:get_contact/core/provider/app_provider.dart';
import 'package:get_contact/core/widgets/error_app_widget.dart';
import 'package:get_contact/core/widgets/loading_app_widget.dart';
import 'package:provider/provider.dart';

abstract class AppWidget<T extends AppProvider, P1, P2>
    extends StatelessWidget {
  AppWidget({Key? key, this.param1, this.param2}) : super(key: key);

  late T notifier;
  final P1? param1;
  final P2? param2;
  FilledButton? _alternatifErrorButton;

  set alternatifErrorButton(FilledButton? param) =>
      _alternatifErrorButton = param;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => sl(param1: param1, param2: param2),
      builder: (context, child) => _build(context),
    );
  }

  Widget _build(BuildContext context) {
    notifier = Provider.of<T>(context);
    checkVariableBeforeUi(context);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (notifier.snackbarSuccessMessage.isNotEmpty) {
          DialogHelper.showSuccessSnackbar(
              context: context, text: notifier.snackbarSuccessMessage);
          notifier.snackbarSuccessMessage = '';
        }

        if (notifier.snackbarWarningMessage.isNotEmpty) {
          DialogHelper.showErrorSnackbar(
              context: context, text: notifier.snackbarWarningMessage);
          notifier.snackbarWarningMessage = '';
        }

        if (notifier.snackbarErrorMessage.isNotEmpty) {
          DialogHelper.showErrorSnackbar(
              context: context, text: notifier.snackbarErrorMessage);
          notifier.snackbarErrorMessage = '';
        }

        checkVariableAfterUi(context);
      },
    );

    return Scaffold(
      appBar: appBarBuild(context),
      body: (notifier.isLoading)
          ? LoadingAppWidget()
          : (notifier.errorMessage.isNotEmpty)
              ? ErrorAppWidget(
                  description: notifier.errorMessage,
                  onPressDefaultButton: () {
                    notifier.init();
                    notifier.errorMeesage = '';
                  },
                  alternatifButton: _alternatifErrorButton,
                )
              : bodyBuild(context),
    );
  }

  void checkVariableBeforeUi(BuildContext context) {}
  void checkVariableAfterUi(BuildContext context) {}
  AppBar? appBarBuild(BuildContext context) => null;
  Widget bodyBuild(BuildContext context);
}
