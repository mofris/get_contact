import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_contact/app/presentations/home/home_screen.dart';
import 'package:get_contact/app/presentations/onboarding/onboarding_notifier.dart';
import 'package:get_contact/core/helper/dialog_helper.dart';
import 'package:get_contact/core/helper/global_helper.dart';
import 'package:get_contact/core/widgets/app_widget.dart';

class OnBoardingScreen extends AppWidget<OnBoardingNotifier, void, void> {
  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigator.pushNamed(context, logInScreenRoute);
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: notifier.pageController,
                itemCount: notifier.onboardData.length,
                onPageChanged: notifier.updatePageIndex,
                itemBuilder: (context, index) {
                  final item = notifier.onboardData[index];
                  final isTextOnTop = index.isOdd;
                  return Column(
                    children: [
                      const Spacer(),
                      if (isTextOnTop)
                        Column(
                          children: [
                            Text(
                              item.title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              item.description,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      if (isTextOnTop) const Spacer(),
                      Image.asset(
                        (Theme.of(context).brightness == Brightness.dark &&
                                item.imageDarkTheme != null)
                            ? item.imageDarkTheme!
                            : item.image,
                        height: 250,
                      ),
                      if (!isTextOnTop) const Spacer(),
                      if (!isTextOnTop)
                        Column(
                          children: [
                            Text(
                              item.title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              item.description,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      const Spacer(),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                ...List.generate(
                  notifier.onboardData.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 20 / 4),
                    child: _dotIndicator(isActive: index == notifier.pageIndex),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 55,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      if (notifier.pageIndex <
                          notifier.onboardData.length - 1) {
                        notifier.pageController.nextPage(
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 500),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                        // DialogHelper.showSuccessSnackbar(
                        //   context: context,
                        //   text: 'Success',
                        // );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Arrow - Right.svg",
                      width: 25,
                      height: 25,
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        GlobalHelper.getColorSchema(context).primary,
                        BlendMode.srcIn,
                      ),
                      theme: const SvgTheme(
                        currentColor: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _dotIndicator extends StatelessWidget {
  final bool isActive;

  const _dotIndicator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
