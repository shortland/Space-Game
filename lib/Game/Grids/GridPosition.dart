// The position of something on the grid,
// grid item (0,0) starts on lower left position.
// grid item (0,1) is to the right of the previous item.
// grid item (1,0) is directly above the first item.

// NOTE: this is for items that want to be positioned directly on a grid block (and fill the wole grid item).
// otherwise you need more specific positioning

class GridPosition {
  int x;
  int y;

  GridPosition(this.x, this.y);
}
