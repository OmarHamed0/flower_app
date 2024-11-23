import 'package:flower_app/src/presentation/managers/home/home_state.dart';
import 'package:flower_app/src/presentation/managers/home/home_viewmodel.dart';
import 'package:flower_app/src/presentation/widgets/home/products/discover_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.discoverNew,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'inter',
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 270,
          child: BlocBuilder<HomeViewModel, HomeState>(
            builder: (context, state) {
              if (state is HomeStateLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is HomeStateSuccess) {
                if (state.products != null && state.products!.isNotEmpty) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products!.length,
                    itemBuilder: (context, index) {
                      final product = state.products![index];
                      return DiscoverProductItem(
                        title: product.title ?? 'Unknown Product',
                        imageUrl: product.imgCover ?? '',
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('No products available'),
                  );
                }
              }
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
