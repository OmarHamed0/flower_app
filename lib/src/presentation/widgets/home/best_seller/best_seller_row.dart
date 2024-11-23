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
          if (state.bestSeller != null && state.bestSeller!.isNotEmpty) {
            return SizedBox(
              height: 210,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.bestSeller!.length,
                itemBuilder: (context, index) {
                  final bestSeller = state.bestSeller![index];
                  return Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: HomeProductItem(
                      imageUrl: bestSeller.imgCover ?? "",
                      title: bestSeller.title ?? "",
                      price: bestSeller.price ?? 0,
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Text(AppLocalizations.of(context)!.noProducts),
            );
          }
        }
        return Center(
          child: Text(AppLocalizations.of(context)!.somethingWentWrong),
        );
      },
    );
  }
}
