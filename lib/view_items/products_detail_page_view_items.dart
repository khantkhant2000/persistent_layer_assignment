import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../data/vos/products_vo/products_vo.dart';
import '../widgets/easy_text_widget.dart';

class ProductsDetailItemsView extends StatelessWidget {
  const ProductsDetailItemsView({
    super.key,
    required this.product,
  });
  final ProductsVO? product;

  @override
  Widget build(BuildContext context) {
    return (product == null)
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ProductView(product: product);
  }
}

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});
  final ProductsVO? product;
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                expandedHeight: kSP450x,
                floating: true,
                pinned: true,
                shape: const Border(bottom: BorderSide.none),
                flexibleSpace: FlexibleSpaceBar(
                  title: EasyText(
                      text: product?.title ?? '',
                      fontSize: kSP12x,
                      textColor: kTextColor),
                  centerTitle: true,
                  background: Image.network(
                    product?.image ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MoreDetailView(
                  about: "Title",
                  aboutSpecific: product?.title ?? '',
                ),
                const SizedBox(
                  height: kSP15x,
                ),
                MoreDetailView(
                  about: "Price",
                  aboutSpecific: "${product?.price ?? 0} \$",
                ),
                const SizedBox(
                  height: kSP15x,
                ),
                MoreDetailView(
                  about: "Rating",
                  aboutSpecific: "${product?.rating?.rate ?? 0}",
                ),
              ],
            ),
          ),
        ));
  }
}

class MoreDetailView extends StatelessWidget {
  const MoreDetailView(
      {Key? key, required this.about, required this.aboutSpecific})
      : super(key: key);
  final String about;
  final String aboutSpecific;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: kSP40x,
            width: kSP130x,
            child: EasyText(
              text: about,
              fontSize: kSP16x,
              fontWeight: FontWeight.w400,
            )),
        Flexible(
            child: EasyText(
                text: aboutSpecific,
                fontSize: kSP16x,
                fontWeight: FontWeight.w400)),
      ],
    );
  }
}
