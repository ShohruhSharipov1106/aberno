import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/assets/constants/icons.dart';
import 'package:aberno_test/core/data/singletons/storage.dart';
import 'package:aberno_test/features/auth/domain/entities/slide_entity.dart';
import 'package:aberno_test/features/auth/presentation/auth_screen.dart';
import 'package:aberno_test/features/auth/presentation/widgets/custom.dart';
import 'package:aberno_test/features/auth/presentation/widgets/dot_indicator.dart';
import 'package:aberno_test/features/call/presentation/call_screen.dart';
import 'package:aberno_test/features/call/presentation/screens/select_product_screen.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_button.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:aberno_test/features/navigation/presentation/home.dart';
import 'package:aberno_test/features/navigation/presentation/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroSlider extends StatefulWidget {
  final BuildContext context;
  final List<SlideEntity> product;

  const IntroSlider({
    super.key,
    required this.product,
    required this.context,
  });

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      keepPage: false,
      viewportFraction: 0.55,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: white),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: double.maxFinite,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: PageView.builder(
                  itemCount: widget.product.length,
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  physics: const BouncingScrollPhysics(),
                  controller: _pageController,
                  itemBuilder: (context, index) => CustomBuilderAnimation(
                    index: index,
                    products: widget.product,
                    pageController: _pageController,
                    currentPage: _currentPage,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 240,
              left: 16,
              right: 16,
              child: Column(
                children: [
                  Text(
                    widget.product[_currentPage].label,
                    key: UniqueKey(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 24),
                  Text(
                    widget.product[_currentPage].subLabel,
                    key: UniqueKey(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: disabledButton.withOpacity(0.6),
                        ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 130,
              left: 16,
              right: 16,
              child: DotsIndicator(
                currentPage: _currentPage,
                onPageSelected: (index) => jumpToPage(index),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 16,
              left: 16,
              right: 16,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                child: _currentPage == widget.product.length - 1
                    ? WButton(
                        onTap: () async {
                          Navigator.of(context).pushAndRemoveUntil(
                            fade(page: const AuthScreen()),
                            (route) => false,
                          );
                          ;
                        },
                        text: "Вход",
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WScaleAnimation(
                              onTap: () async {
                                StorageRepository.putBool(
                                    key: StoreKeys.onboarding, value: true);
                                Navigator.of(context).pushAndRemoveUntil(
                                  fade(page: const AuthScreen()),
                                  (route) => false,
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  "Пропустить",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ),
                            const Spacer(),
                            WScaleAnimation(
                              onTap: () async {
                                if (_currentPage < widget.product.length - 1) {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.linear,
                                  );
                                } else {
                                  await StorageRepository.putBool(
                                      key: StoreKeys.onboarding, value: true);
                                  Navigator.of(context).pushReplacement(
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const AuthScreen()));
                                }
                              },
                              child: Container(
                                width: 62,
                                height: 62,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(84),
                                  color: mainColor,
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                padding: EdgeInsets.all(16),
                                child: SvgPicture.asset(AppIcons.arrowRight),
                              ),
                            )
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void jumpToPage(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
