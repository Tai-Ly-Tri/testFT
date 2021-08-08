import 'package:flutter/material.dart';
import 'package:test_ft/model/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Gio hang".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

//button mua va gia
class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}"
              .text
              .xl5
              .color(context.theme.accentColor)
              .make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Tinh nang nay chua ho tro".text.make()));
            },
            child: "Mua".text.make(),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.buttonColor),
            ),
          ).w32(context)
        ],
      ),
    );
  }
}

//List cart
class _CartList extends StatefulWidget {
  // const _CartList({Key? key}) : super(key: key);
  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Khong co san pham".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      _cart.remove(_cart.items[index]);
                      setState(() {});
                    },
                  ),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
