// import 'dart:math' as math;
// import 'dart:ui';

// import 'package:flame/animation.dart';
// import 'package:flame/components/animation_component.dart';
// import 'package:flame/components/component.dart';
// import 'package:flame/components/mixins/resizable.dart';
// import 'package:flame/position.dart';
// import 'package:flame/sprite.dart';
// import 'package:box2d_flame/box2d.dart';
// import 'package:flame/animation.dart';
// import 'package:flame/components/component.dart';
// import 'package:flame/components/animation_component.dart';

// import 'package:spacegame/Game/Grids/GridPosition.dart';
// import 'package:spacegame/Game/Grids/GridSize.dart';
// import 'Building.dart';
// import 'BuildingType.dart';
// import '../../Mixins/HasGameRef.dart';
// import '../../Data/GridData.dart';
// import '../Structures/HollowRectangleStructure.dart';
// import '../../Grids/GridItem.dart';

// // abstract class Renderable extends Component {}

// // like a controller class/obj for the structures
// class MainBaseBuilding extends Component with HasGameRef, Resizable {
//   BuildingType type;
//   bool created = false;
//   GridPosition pos;
//   GridSize sizeG;

//   // Components to render
//   // List<dynamic> structs;

//   Animation buildingBg;
//   AnimationComponent buildingBgAn;

//   MainBaseBuilding(this.pos, this.sizeG);

//   AnimationComponent buildAnimation(animation) {
//     AnimationComponent ac = AnimationComponent(100, 100, animation);
//     ac.x = 200;
//     ac.y = 200;

//     return ac;
//   }

//   void create() {
//     // building bg
//     buildingBg = Animation.sequenced('buildings/someroom_bg.png', 10,
//         textureWidth: 128.0, textureHeight: 50);
//     buildingBgAn = buildAnimation(buildingBg);

//     structs.add(buildingBgAn);
//     // structs.add(buildingBg);
//   }

//   @override
//   void render(Canvas c) {
//     // buildingBg.renderCentered()
//     // Rect rec = Rect.fromLTWH(10, 10, 200, 100);
//     // c.drawRect(rec, paint)
//     print("attempting to render main base building");
//     buildingBgAn?.render(c);
//   }

//   @override
//   void update(double dt) {
//     // buildingBg.update(dt);
//     buildingBgAn?.update(dt);
//   }

//   @override
//   void resize(Size size) {}
// }
