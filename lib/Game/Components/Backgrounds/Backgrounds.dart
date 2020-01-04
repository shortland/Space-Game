enum Backgrounds {
  PLAIN,
  SPACE,
}

String bgEnumToString(Backgrounds bg) {
  int index = Backgrounds.values.indexOf(bg);
  if (index == 0) {
    return 'bgs/plain_tall.png';
  } else if (index == 1) {
    return 'bgs/space_tall.png';
  } else {
    return 'bgs/plain_tall.png';
  }
}
