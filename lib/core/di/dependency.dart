import 'package:get_contact/app/presentations/home/home_notifier.dart';
import 'package:get_contact/app/presentations/onboarding/onboarding_notifier.dart';
import 'package:get_contact/app/presentations/splash/splash_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;

Future<void> initDependency() async {
  //dio
  Dio dio = Dio();
  dio.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ),
  );
  sl.registerSingleton<Dio>(dio);

  // provider
  sl.registerFactoryParam<OnBoardingNotifier, void, void>(
    (param1, param2) => OnBoardingNotifier(),
  );
  sl.registerFactoryParam<SplashNotifier, void, void>(
    (param1, param2) => SplashNotifier(),
  );
  sl.registerFactoryParam<HomeNotifier, void, void>(
    (param1, param2) => HomeNotifier(),
  );
}
