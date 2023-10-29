// import 'package:flutter/widgets.dart';
// import 'package:flutter_animator/flutter_animator.dart';
//
// class ShakeAnimation extends AnimationDefinition {
//   ShakeAnimation ({
//     AnimationPreferences preferences = const AnimationPreferences(),
//   }) : super(preferences: preferences);
//
//   @override
//   Widget build(BuildContext cntext, Animator animator, Widget child) =>
//
//       AnimatedBuilder(
//           animation: animator.controller,
//           builder: (BuildContext context, Widget child) => Transform(
//             transform: Matrix4.translationValues(
//                 animator.get("translateX").value,
//                 0.0,
//                 0.0,
//             ),
//             child: child,
//           ),
//       );
//
// }
