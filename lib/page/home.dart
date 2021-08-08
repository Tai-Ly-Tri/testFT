import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_ft/model/cart.dart';
import 'package:test_ft/model/product.dart';
import 'package:test_ft/page/detail.dart';
import 'package:test_ft/utils/routes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final productJson = await rootBundle.loadString("assets/file/product.json");
    final decodedData = jsonDecode(productJson);
    var productData = decodedData["products"];
    ProductModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoutes),
        backgroundColor: context.theme.buttonColor,
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ).badge(
          color: Vx.red500,
          size: 20,
          count: _cart.items.length,
          textStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ProductHeader(),
              if (ProductModel.items.isNotEmpty)
                ProductList().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ])),
      ),
    );
  }
}

class ProductHeader extends StatelessWidget {
  const ProductHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Shop Phone".text.xl5.bold.color(context.theme.accentColor).make(),
        "Muc yeu thich".text.xl2.color(context.theme.accentColor).make()
      ],
    );
  }
}

//list
class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: ProductModel.items.length,
        itemBuilder: (context, index) {
          final product = ProductModel.items[index];
          return InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetail(product: product),
                    ),
                  ),
              child: ProductItem(product: product));
        });
  }
}

//item
class ProductItem extends StatelessWidget {
  final Item product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(product.id.toString()),
            child: ProductImage(image: product.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            product.name.text.lg
                .color(context.accentColor)
                .capitalize
                .bold
                .make(),
            product.desc.text.capitalize.color(context.accentColor).make(),
            10.heightBox,
            ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${product.price}"
                      .text
                      .bold
                      .xl
                      .color(context.accentColor)
                      .make(),
                  _AddToCart(product: product)
                ]).pOnly(right: 8.0)
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}

//khung hinh san pham
class ProductImage extends StatelessWidget {
  final String image;

  const ProductImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(context.canvasColor)
        .make()
        .p16()
        .w40(context);
  }
}

//nut mua
class _AddToCart extends StatefulWidget {
  final Item product;

  const _AddToCart({Key? key, required this.product}) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<_AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.product);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _product = ProductModel();

          _cart.product = _product;
          _cart.add(widget.product);
          setState(() {});
        }
      },
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
