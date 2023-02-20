import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListViewBuilder extends StatelessWidget {
  final int index;
  final Widget child;

  const AnimatedListViewBuilder({Key? key, required this.index, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 400),
      child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(child: child)
      ),
    );
  }
}
