import 'package:flutter/cupertino.dart';

abstract class AppProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _isDispose = false;
  bool _isOnboarding = false;
  String _errorMessage = '';
  String _snackbarErrorMessage = '';
  String _snackbarSuccessMessage = '';
  String _snackbarWarningMessage = '';

  bool get isLoading => _isLoading;
  bool get isDispose => _isDispose;
  bool get isOnboarding => _isOnboarding;
  String get errorMessage => _errorMessage;
  String get snackbarErrorMessage => _snackbarErrorMessage;
  String get snackbarWarningMessage => _snackbarWarningMessage;
  String get snackbarSuccessMessage => _snackbarSuccessMessage;

  set errorMeesage(String param) => _errorMessage = param;
  set snackbarErrorMessage(String param) => _snackbarErrorMessage = param;
  set snackbarWarningMessage(String param) => _snackbarWarningMessage = param;
  set snackbarSuccessMessage(String param) => _snackbarSuccessMessage = param;

  set isOnboarding(bool param) {
    _isOnboarding = param;
    notifyListeners();
  }

  void showLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void hideLoading() {
    _isLoading = false;
    notifyListeners();
  }

  void init();

  @override
  void dispose() {
    _isDispose = true;
    super.dispose();
  }
}
