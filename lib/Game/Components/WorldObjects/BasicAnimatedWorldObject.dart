// import 'AnimatedWorldObject.dart';
// import 'package:flutter/material.dart';
// import 'package:flame/animation.dart' as FlameAnimation;

// abstract class BasicAnimatedWorldObject extends AnimatedWorldObject {
//   double height;
//   double width;
//   FlameAnimation.Animation animationPretty;

//   Rect position;

//   double initmapPaddingLeft;
//   double initmapPaddingTop;

//   BasicAnimatedWorldObject({
//     double height = 16.0,
//     double width = 16.0,
//     animationPretty,
//   }) {
//     this.height = height;
//     this.width = width;
//     this.animationPretty = animationPretty;

//     this.position = Rect.fromLTWH(0, 0, width, height);
//   }

//   void setInitPosition(Rect position) {
//     this.position = Rect.fromLTWH(
//         position.left, position.top, this.position.width, this.position.height);
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);
//   }

//   @override
//   void render(Canvas canvas) {
//     super.renderRect(canvas, position);
//   }
// }
