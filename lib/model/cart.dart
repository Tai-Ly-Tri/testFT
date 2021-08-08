import 'package:test_ft/model/product.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;


  //product field
  late ProductModel _product;


  //Id cua tung san pham
  final List<int> _itemIds = [];

  // get san pham
  ProductModel get product => _product;

  set product(ProductModel newProduct) => _product = newProduct;

  //get items vao cart
  List<Item> get items => _itemIds.map((id) => _product.getById(id)).toList();

  //get gia tong
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }

}
