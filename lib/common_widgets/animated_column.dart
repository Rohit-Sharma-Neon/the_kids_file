import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedColumn extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets? padding;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final int animationDuration;

  const AnimatedColumn({Key? key, required this.children, this.padding = EdgeInsets.zero,
    this.crossAxisAlignment = CrossAxisAlignment.center, this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max, this.animationDuration = 375}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: padding,
        child: AnimationLimiter(child: Column(
          crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: AnimationConfiguration.toStaggeredList(
        duration: Duration(milliseconds: animationDuration),
        childAnimationBuilder: (widget) => SlideAnimation(
          verticalOffset: 50,
          child: FadeInAnimation(
            child: widget,
          ),
        ), children: children,
      ),
    )));
  }
}
