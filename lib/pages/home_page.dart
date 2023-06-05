import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../data/model/product_model_impl.dart';
import '../data/model/products_model.dart';
import '../data/vos/products_vo/products_vo.dart';
import '../view_items/home_page_view_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductsModel _productsModel = ProductsModelImpl();
  List<ProductsVO> products = [];

  @override
  void initState() {
    _productsModel.getProductsList();

    _productsModel.getProductsListFromDataBase().listen((event) {
      if (mounted) {
        setState(() {
          products = event ?? [];
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kHomePageBackgroundColor,
        appBar: AppBar(
          title: const Text("Persistent Assignment"),
          backgroundColor: kAppbarColor,
          centerTitle: true,
        ),
        body: products.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                    children: products
                        .map((e) => ProductsItemsView(products: e))
                        .toList())));
  }
}
