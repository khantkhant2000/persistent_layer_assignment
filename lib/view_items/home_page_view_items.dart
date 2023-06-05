import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../data/vos/products_vo/products_vo.dart';
import '../pages/product_detail_page.dart';
import '../widgets/easy_text_widget.dart';

class ProductsItemsView extends StatelessWidget {
  const ProductsItemsView({super.key, required this.products});
  final ProductsVO? products;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kCardBackgroundColor,
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ProductsDetailPage(productsId: products?.id ?? 0)));
        },
        leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(products?.image ?? '')),
        title: EasyText(text: products?.title ?? ''),
        subtitle: Text(products?.description ?? '',
            style: const TextStyle(
                color: kTextColorForDescription,
                fontSize: kSP12x,
                fontWeight: FontWeight.w400)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.monetization_on),
            Text("${products?.price ?? 0}",
                style: const TextStyle(color: kTextColorForPrice))
          ],
        ),
      ),
    );
  }
}
