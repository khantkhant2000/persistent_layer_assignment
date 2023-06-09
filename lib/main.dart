import 'package:fake_store_assgiment/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constant/hive_constant.dart';
import 'data/vos/products_vo/products_vo.dart';
import 'data/vos/rating_vo/rating_vo.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ProductsVOAdapter());
  Hive.registerAdapter(RatingVOAdapter());

  await Hive.openBox<ProductsVO>(kBoxNameForProductsVO);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
