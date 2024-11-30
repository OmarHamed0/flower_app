import 'package:flower_app/src/domain/entities/home/product_model.dart';
import 'package:flower_app/src/presentation/widgets/home/products/discover_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key, required this.productsHome});
  final List<ProductsModel>? productsHome;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.discoverNew,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'inter',
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productsHome?.length,
            itemBuilder: (context, index) {
              final product = productsHome?[index];
              return DiscoverProductItem(
                title: product?.title ?? 'Unknown Product',
                imageUrl: product?.imgCover ?? '',
              );
            },
          ),
        ),
      ],
    );
  }
}
