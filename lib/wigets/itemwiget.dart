import 'package:flutter/material.dart';
import 'package:test_ft/model/product.dart';

class ItemWiget extends StatelessWidget {
  final Item item;

  const ItemWiget({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){print("dang chon ${item.name}");},
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
            "\$${item.price.toString()}",
            style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
