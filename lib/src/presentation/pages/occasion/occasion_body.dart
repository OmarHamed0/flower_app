import 'package:flower_app/src/presentation/managers/occasion/occasion_states.dart';
import 'package:flower_app/src/presentation/managers/occasion/occasions_view_model.dart';
import 'package:flower_app/src/presentation/managers/product/core/product_core.dart';
import 'package:flower_app/src/presentation/managers/product/product_cubit.dart';
import 'package:flower_app/src/presentation/managers/product/product_event.dart';
import 'package:flower_app/src/presentation/pages/occasion/occasions_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/common.dart';
import '../product/view/product_view.dart';

class OccasionBody extends StatelessWidget {
  final String? occasionId;

  const OccasionBody({super.key, this.occasionId});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<OccasionViewModel>();
    final productViewModel = context.read<ProductCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: OccasionsBar(
              occasions: viewModel.occasionsList.map((e) => e.name).toList(),
            ),
          ),
          SliverFillRemaining(
            child: BlocBuilder<OccasionViewModel, OccasionsStates>(
                builder: (context, state) {
              if (state is ChangeOccasionState) {
                productViewModel.doAction(
                  GetProductEvent(
                    productQueryParameters: ProductQueryParameters(
                      productEndPoints: ProductEndPoints.products,
                      productQuery: ProductQuery.occasion,
                      productId: state.id,
                    ),
                  ),
                );
                return const ProductView();
              } else {
                productViewModel.doAction(
                  GetProductEvent(
                    productQueryParameters: ProductQueryParameters(
                        productEndPoints: ProductEndPoints.products,
                        productQuery: ProductQuery.occasion,
                        productId: viewModel.occasionsList[viewModel.selectedIndex].id),
                  ),
                );
                return const ProductView();
              }
            }),
          )
        ],
      ),
    );
  }
}
