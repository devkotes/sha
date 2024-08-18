import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sha/models/onboard.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/custom_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselSliderController carouselController = CarouselSliderController();

  List<Onboard> onboardContent = [
    const Onboard(
      index: 0,
      title: 'Grow Your\nFinancial Today',
      subtitle: 'Our system is helping you to\nachieve a better goal',
      imgAsset: 'assets/images/img_onboarding_1.png',
    ),
    const Onboard(
      index: 1,
      title: 'Build From\nZero to Freedom',
      subtitle: 'We provide tips for you so that\nyou can adapt easier',
      imgAsset: 'assets/images/img_onboarding_2.png',
    ),
    const Onboard(
      index: 2,
      title: 'Start Together',
      subtitle: 'We will guide you to where\nyou wanted it too',
      imgAsset: 'assets/images/img_onboarding_3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: onboardContent
                  .map(
                    (Onboard onboard) => Image.asset(
                      onboard.imgAsset,
                      height: 330,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 330,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              carouselController: carouselController,
            ),
            const SizedBox(height: 80),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(
                horizontal: 22,
                vertical: defaultMargin,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 26),
                    child: Text(
                      onboardContent[currentIndex].title,
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    onboardContent[currentIndex].subtitle,
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: currentIndex != 2 ? 50 : 38),
                  (currentIndex != 2)
                      ? Row(
                          children: [
                            Row(
                              children: onboardContent
                                  .map(
                                    (Onboard onboard) => Container(
                                      width: 12,
                                      height: 12,
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        color: (currentIndex == onboard.index)
                                            ? kBlueColor
                                            : kLightBackgroundColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            const Spacer(),
                            CustomButton(
                              width: 150,
                              text: 'Continue',
                              onPressed: () {
                                carouselController.nextPage();
                              },
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            CustomButton(text: 'Get Started', onPressed: () {}),
                            Container(
                              width: double.infinity,
                              height: 50,
                              margin: const EdgeInsets.only(top: 20),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: kTransparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(56),
                                  ),
                                ),
                                child: Text(
                                  'Sign In',
                                  style: greySecondTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
