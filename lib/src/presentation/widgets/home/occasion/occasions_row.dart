import 'package:flower_app/src/presentation/managers/home/home_state.dart';
import 'package:flower_app/src/presentation/managers/home/home_viewmodel.dart';
import 'package:flower_app/src/presentation/widgets/home/home_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OccasionsRow extends StatelessWidget {
  const OccasionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeState>(
      builder: (context, state) {
        if (state is HomeStateLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is HomeStateSuccess) {
          final occasionProduct = state.products?.occasions;

          if (occasionProduct != null && occasionProduct.isNotEmpty) {
            return SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: occasionProduct.length,
                itemBuilder: (context, index) {
                  final occasions = occasionProduct[index];
                  return Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: HomeProductItem(
                      imageUrl: occasions.image ?? "",
                      title: occasions.name ?? "",
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
