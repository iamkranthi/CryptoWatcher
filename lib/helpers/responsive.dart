import 'package:flutter/widgets.dart';

class Responsive {
  static double? _width;
  static double? _height;
  static double? _textScaleFactor;

  Responsive({
    required BuildContext context,
  }) {
    final mediaQueryData = MediaQuery.of(context);
    _width = mediaQueryData.size.width;
    _height = mediaQueryData.size.height;
    _textScaleFactor = mediaQueryData.textScaleFactor;
  }

  double wp(double percent) => _width! * (percent / 100);
  double hp(double percent) => _height! * (percent / 100);
  double sp(double percent) => _textScaleFactor! * (percent / 3.1);

  static void init(BuildContext context) {}
}

class LayoutBuilderWidget extends StatelessWidget {
  final Widget Function(BuildContext, Responsive) builder;

  const LayoutBuilderWidget({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return builder(
          context,
          Responsive(
            context: context,
          ),
        );
      },
    );
  }
}