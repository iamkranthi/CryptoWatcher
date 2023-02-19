import 'package:crypto_currency_price_tracker/pages/homepage.dart';
import 'package:crypto_currency_price_tracker/widgets/intro.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: const [
              Intro(
                image: 'assets/images/intro2.jpeg',
                text: 'Track all cryptocurrencies from the top of the world',
              ),
              Intro(
                image: 'assets/images/intro1.jpeg',
                text: 'Explore the heights of the digital currency market.',
              ),
              Intro(
                image: 'assets/images/intro3.jpeg',
                text:
                    'Explore the world of cryptocurrencies with Crypto Watcher',
              )
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text("Skip")),
                SmoothPageIndicator(controller: _controller, count: 3),
                onLastPage
                    ? IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Homepage(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_rounded, size: 30),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text("Next page"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
