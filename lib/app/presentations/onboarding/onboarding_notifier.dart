import 'package:flutter/material.dart';
import 'package:get_contact/core/provider/app_provider.dart';

class OnBoardingNotifier extends AppProvider {
  @override
  void init() {}

  final PageController pageController = PageController(initialPage: 0);
  int pageIndex = 0;

  final List<Onboard> onboardData = [
    Onboard(
      image: "assets/illustration/Illustration-0.png",
      imageDarkTheme: "assets/illustration/Illustration_darkTheme_0.png",
      title: "Find the item you’ve \nbeen looking for",
      description:
          "Here you’ll see rich varieties of goods, carefully classified for seamless browsing experience.",
    ),
    Onboard(
      image: "assets/illustration/Illustration-1.png",
      imageDarkTheme: "assets/illustration/Illustration_darkTheme_1.png",
      title: "Get those shopping \nbags filled",
      description:
          "Add any item you want to your cart, or save it on your wishlist, so you don’t miss it in your future purchases.",
    ),
    Onboard(
      image: "assets/illustration/Illustration-2.png",
      imageDarkTheme: "assets/illustration/Illustration_darkTheme_2.png",
      title: "Fast & secure \npayment",
      description: "There are many payment options available for your ease.",
    ),
    Onboard(
      image: "assets/illustration/Illustration-3.png",
      imageDarkTheme: "assets/illustration/Illustration_darkTheme_3.png",
      title: "Package tracking",
      description:
          "In particular, Shoplon can pack your orders, and help you seamlessly manage your shipments.",
    ),
    Onboard(
      image: "assets/illustration/Illustration-4.png",
      imageDarkTheme: "assets/illustration/Illustration_darkTheme_4.png",
      title: "Nearby stores",
      description:
          "Easily track nearby shops, browse through their items and get information about their products.",
    ),
  ];

  void updatePageIndex(int value) {
    pageIndex = value;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

class Onboard {
  final String image, title, description;
  final String? imageDarkTheme;

  Onboard({
    required this.image,
    required this.title,
    this.description = "",
    this.imageDarkTheme,
  });
}
