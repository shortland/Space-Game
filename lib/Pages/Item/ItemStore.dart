import 'Item.dart';

enum ItemType {
  TYPE_ONE,
  TYPE_TWO,
  TYPE_THREE,
}

Map<ItemType, String> itemTypes = {
  ItemType.TYPE_ONE: 'type 1 items',
  ItemType.TYPE_TWO: 'type 2 items',
  ItemType.TYPE_THREE: 'type 3 items',
};

List<Item> itemStore(ItemType type) {
  switch (type) {
    case ItemType.TYPE_ONE:
      return itemsList[0];

    case ItemType.TYPE_TWO:
      return itemsList[1];

    case ItemType.TYPE_THREE:
      return itemsList[2];

    default:
      // TODO: some type of error logger here.
      print("unknown type of item list requested from itemStore");
      return itemsList[0];
  }
}

List<List<Item>> itemsList = [
  // ItemType.TYPE_ONE
  [
    Item(
      name: 'some item',
      price: 100.0,
    ),
    Item(
      name: 'some other',
      price: 150.0,
    ),
    Item(
      name: 'another item',
      price: 300.0,
    ),
    Item(
      name: 'and another',
      price: 600.0,
    ),
    Item(
      name: 'some item',
      price: 100.0,
    ),
    Item(
      name: 'some other',
      price: 150.0,
    ),
    Item(
      name: 'another item',
      price: 300.0,
    ),
    Item(
      name: 'and another',
      price: 600.0,
    ),
    Item(
      name: 'some item',
      price: 100.0,
    ),
    Item(
      name: 'some other',
      price: 150.0,
    ),
    Item(
      name: 'another item',
      price: 300.0,
    ),
    Item(
      name: 'and another',
      price: 600.0,
    ),
  ],
  // ItemType.TYPE_TWO
  [
    Item(
      name: 'some item 2',
      price: 100.20,
    ),
    Item(
      name: 'some other 2',
      price: 150.20,
    ),
    Item(
      name: 'another item 2',
      price: 300.20,
    ),
    Item(
      name: 'and another 2',
      price: 600.20,
    ),
  ],
  // ItemType.TYPE_THREE
  [
    Item(
      name: 'some item 3',
      price: 300.0,
    ),
    Item(
      name: 'some other 3',
      price: 350.0,
    ),
    Item(
      name: 'another item 3',
      price: 400.0,
    ),
    Item(
      name: 'and another 3',
      price: 800.0,
    ),
  ],
];
