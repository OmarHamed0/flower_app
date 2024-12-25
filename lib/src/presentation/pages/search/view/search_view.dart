import 'package:flower_app/common/common.dart';
import 'package:flower_app/src/presentation/managers/product/core/product_core.dart';
import 'package:flower_app/src/presentation/managers/product/product_cubit.dart';
import 'package:flower_app/src/presentation/managers/product/product_event.dart';
import 'package:flower_app/src/presentation/pages/product/view/product_view.dart';

import '../../../../../core/functions/spacing.dart';
import '../../../../../core/styles/colors/app_colors.dart';
import '../../product/widget/show_sort_options_bottom_sheet_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            ProductCubit.of(context).doAction(GetProductEvent(
                                productQueryParameters: ProductQueryParameters(
                                    productEndPoints: ProductEndPoints.products,
                                    productQuery: ProductQuery.search,
                                    productId: value)));
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: "Search",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                            const BorderSide(color: AppColors.kWhite70),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                            const BorderSide(color: AppColors.kWhite70),
                          ),
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                    horizontalSpace(8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.filter_list),
                        onPressed: () {
                          showSortOptions(context,);
                        },
                      ),
                    ),
                  ],
                ),
                verticalSpace(10),
                const Expanded(
                  child: ProductView(),
                ),
              ],
            ),
          ),
        )
    );
  }
}
