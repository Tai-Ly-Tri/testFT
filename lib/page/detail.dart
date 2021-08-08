import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_ft/model/cart.dart';
import 'package:test_ft/model/product.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  final Item product;

  const HomeDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.all(10),
            children: [
              "\$${product.price}".text.bold.xl4.red800.make(),
              AddToCartDetail(product: product,).wh(100, 50)
            ]).py32(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                    tag: Key(product.id.toString()),
                    child: Image.network(product.image))
                .h32(context),
            Expanded(
                child: VxArc(
                    height: 10.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            product.name.text.xl4
                                .color(context.accentColor)
                                .capitalize
                                .bold
                                .make(),
                            product.desc.text.xl
                                .color(context.accentColor)
                                .capitalize
                                .make(),
                            10.heightBox,
                            "Điều kiện áp dụng:"
                                .text
                                .color(context.accentColor)
                                .make(),
                            "  . Giao hàng nhanh chóng (tuỳ khu vực)."
                                .text
                                .color(context.accentColor)
                                .make(),
                            "  . Bảo hành, đổi trả áp dụng như mua giá thường."
                                .text
                                .color(context.accentColor)
                                .make(),
                            "  . Mỗi số điện thoại chỉ mua 1 sản phẩm trong 1 tháng."
                                .text
                                .color(context.accentColor)
                                .make(),
                          ],
                        ).py64(),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}

class AddToCartDetail extends StatefulWidget {
  final Item product;
  const AddToCartDetail({
    Key? key, required this.product
  }) : super(key: key);

  @override
  _AddToCartDetailState createState() => _AddToCartDetailState();
}

class _AddToCartDetailState extends State<AddToCartDetail> {
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
          backgroundColor:
              MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
