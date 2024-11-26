import 'package:flower_app/src/presentation/managers/home/home_state.dart';
import 'package:flower_app/src/presentation/managers/home/home_viewmodel.dart';
import 'package:flower_app/src/presentation/widgets/home/home_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BestSellerRow extends StatelessWidget {
  const BestSellerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeState>(
      builder: (context, state) {
        if (state is HomeStateLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is HomeStateSuccess) {
          final bestSellerProducts = state.products?.bestSeller;

          if (bestSellerProducts != null && bestSellerProducts.isNotEmpty) {
            return SizedBox(
              height: 210,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bestSellerProducts.length,
                itemBuilder: (context, index) {
                  final bestSeller = bestSellerProducts[index];
                  return Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: HomeProductItem(
                      imageUrl:
                          bestSeller.imgCover ?? "", // Ensure default value
                      title: bestSeller.title ??
                          "Unknown Product", // Fallback title
                      price: bestSeller.price ?? 0, // Fallback price
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Text(AppLocalizations.of(context)?.noProducts ??
                  "No products available."),
            );
          }
        }

        // Default fallback for other states
        return Center(
          child: Text(AppLocalizations.of(context)?.somethingWentWrong ??
              "Something went wrong."),
        );
      },
    );
  }
}
