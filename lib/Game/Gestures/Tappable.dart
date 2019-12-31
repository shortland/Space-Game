abstract class Tappable {
  // Callback for custom function on tap event
  void Function(int) bindCallback;

  void onTapDown();

  void onTapUp();
}
