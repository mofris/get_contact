import 'package:get_contact/core/constant/constant.dart';
import 'package:get_contact/core/helper/shared_preferences_helper.dart';
import 'package:get_contact/core/provider/app_provider.dart';

class HomeNotifier extends AppProvider {
  HomeNotifier() {
    init();
  }

  @override
  void init() {
    print('jalankan');
    _checkOnboarding();
  }

  _checkOnboarding() async {
    showLoading();
    await SharedPreferencesHelper.setBool(PREF_ONBOARDING, true);
    hideLoading();
  }
}
