// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/app/app_routes.dart';
import 'package:flutter_mobile_application/providers/onboarding_provider.dart';
import 'package:flutter_mobile_application/widgets/common_loading_widget.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onClickedNext() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  void _onClickedPreview() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  void _onClickedSkip() async {
    await context.read<OnboardingProvider>().onFinished();
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<OnboardingProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                // header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      if (!provider.isFirst)
                        TextButton(
                          onPressed: _onClickedPreview,
                          child: Text('Previous'),
                        ),

                      Spacer(),

                      TextButton(
                        onPressed: _onClickedSkip,
                        child: Text('Skip'),
                      ),
                    ],
                  ),
                ),

                // body
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: provider.pages.length,
                    onPageChanged: (int index) {
                      context.read<OnboardingProvider>().onPageChanged(index);
                    },
                    itemBuilder: (context, index) {
                      final page = provider.pages[index];

                      return Padding(
                        padding: .symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: .center,
                          children: [
                            //
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: page.bgColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  page.emoji,
                                  style: TextStyle(fontSize: 75),
                                ),
                              ),
                            ),

                            SizedBox(height: 40),

                            //
                            Text(
                              page.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: .w700,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),

                            SizedBox(height: 15),

                            Text(
                              page.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: .w500,
                                fontSize: 16,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // indicator
                Row(
                  mainAxisAlignment: .center,
                  spacing: 5,
                  children: [
                    for (var index = 0; index < provider.pages.length; index++)
                      AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        height: 10,
                        width: provider.activeIndex == index ? 25 : 10,
                        decoration: BoxDecoration(
                          color: provider.activeIndex == index
                              ? provider.activeOnboarding.color
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                  ],
                ),

                // bottom
                GestureDetector(
                  onTap: provider.isLast ? _onClickedSkip : _onClickedNext,
                  child: Container(
                    height: 45,
                    margin: .symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: provider.activeOnboarding.color,
                    ),
                    alignment: .center,
                    child: provider.isLoading
                        ? CommonLoadingWidget()
                        : Text(
                            provider.isLast ? 'Get Start' : 'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: .w500,
                            ),
                          ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
