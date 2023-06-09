import 'package:flutter/material.dart';

import '../data/model/product_model_impl.dart';
import '../data/model/products_model.dart';
import '../data/vos/products_vo/products_vo.dart';
import '../view_items/home_page_view_items.dart';
import '../view_items/products_detail_page_view_items.dart';

class ProductsDetailPage extends StatefulWidget {
  const ProductsDetailPage({super.key, required this.productsId});

  final int productsId;

  @override
  State<ProductsDetailPage> createState() => _ProductsDetailPageState();
}

class _ProductsDetailPageState extends State<ProductsDetailPage> {
  final ProductsModel _productsModel = ProductsModelImpl();
  ProductsVO? product;

  @override
  void initState() {
    if (mounted) {
      setState(() {
        product = _productsModel.getProductDetail(widget.productsId);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ProductsDetailItemsView(product: product),
    );
  }
}
