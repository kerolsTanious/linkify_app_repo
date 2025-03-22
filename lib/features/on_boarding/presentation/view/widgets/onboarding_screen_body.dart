import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/reusable_components/onboarding_page.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/strings_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/splash/presentation/view/splash.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreenBody extends StatefulWidget {
  const OnboardingScreenBody({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<OnboardingScreenBody> createState() => _OnboardingScreenBodyState();
}

class _OnboardingScreenBodyState extends State<OnboardingScreenBody> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(
        right: 16,
        left: 16,
        bottom: 16,
        top: 40,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Splash(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                  ),
                  child: Text(
                    "Skip",
                    style: Styles.textStyle20.copyWith(
                      color: ColorManager.texColor
                    ),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width / 3),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (pageIndex == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Splash(),
                        ),
                      );
                    } else {
                      widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.mainColor,
                  ),
                  child: Text(
                    "Next",
                    style: Styles.textStyle20,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                pageIndex = value;
                setState(() {});
              },
              controller: widget.pageController,
              children: const [
                OnboardingPage(
                  image: AssetsManager.onboarding1,
                  title: StringsManager.onboarding1Title,
                  description: StringsManager.onboarding1Description,
                ),
                OnboardingPage(
                  image: AssetsManager.onboarding2,
                  title: StringsManager.onboarding2Title,
                  description: StringsManager.onboarding2Description,
                ),
                OnboardingPage(
                  image: AssetsManager.onboarding3,
                  title: StringsManager.onboarding3Title,
                  description: StringsManager.onboarding3Description,
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: widget.pageController,
            count: 3, // Number of pages
            effect: const ExpandingDotsEffect(
              activeDotColor: Colors.blue,
              dotColor: Colors.grey,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),
        ],
      ),
    );
  }
}
