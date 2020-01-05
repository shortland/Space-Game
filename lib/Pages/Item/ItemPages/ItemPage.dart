import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

import '../Item.dart';
import '../ItemStore.dart';

class ItemPage extends StatelessWidget {
  final ItemType itemType;
  final List<Item> itemList = [];

  ItemPage({
    Key key,
    this.itemType,
  }) : super(key: key) {
    itemList.addAll(itemStore(itemType));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (BuildContext content, int index) {
        Item item = itemList[index];
        return ItemListTile(item, context);
      },
    );
  }
}

class ItemListTile extends ListTile {
  ItemListTile(Item item, BuildContext context)
      : super(
          title: Text(item.name),
          subtitle: Text(item.price.toString()),
          leading: CircleAvatar(
            child: Text(item.name[0]),
          ),
          onTap: () {
            _promptToPurchase(item.name, context);
          },
        );

  static void _promptToPurchase(String name, BuildContext context) {
    Flushbar(
      title: "buy item?",
      message: "would u like to buy " + name + "?",
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.blue[900],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.blue[800],
          offset: Offset(0.0, 2.0),
          blurRadius: 3.0,
        )
      ],
      isDismissible: false,
      duration: Duration(seconds: 2),
      leftBarIndicatorColor: Colors.blue[900],
    )..show(context);
  }
}
