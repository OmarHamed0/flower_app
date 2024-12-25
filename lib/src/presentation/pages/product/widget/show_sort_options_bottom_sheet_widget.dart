import 'package:flower_app/common/common.dart';
import 'package:flower_app/src/presentation/managers/product/product_event.dart';

import '../../../../../core/functions/spacing.dart';
import '../../../../../core/styles/colors/app_colors.dart';
import '../../../managers/product/core/product_core.dart';
import '../../../managers/product/product_cubit.dart';


  void showSortOptions(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.kWhiteBase,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Text(
                'Sort Options',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(10),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.arrow_upward),
                title: const Text("sort by the Price After Discount in Ascending order"),
                onTap: () {
                  Navigator.pop(context);
                  ProductCubit.of(context).doAction(GetProductEvent(
                    productQueryParameters: ProductQueryParameters(
                      productEndPoints: ProductEndPoints.products,
                      productQuery: ProductQuery.sortQuantityAscending,
                    ),
                  ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.arrow_downward),
                title: const Text('sort by the quantity in Descending order'),
                onTap: () {
                  Navigator.pop(context);
                  ProductCubit.of(context).doAction(GetProductEvent(
                    productQueryParameters: ProductQueryParameters(
                      productEndPoints: ProductEndPoints.products,
                      productQuery: ProductQuery.sortQuantityDescending,
                    ),
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.percent),
                title: const Text('ort by the Price After Discount in Ascending order'),
                onTap: () {
                  Navigator.pop(context);
                  ProductCubit.of(context).doAction(GetProductEvent(
                    productQueryParameters: ProductQueryParameters(
                      productEndPoints: ProductEndPoints.products,
                      productQuery: ProductQuery.sortPriceAfterDiscount,
                    ),
                  ));
                },
              ),
            ],
          ),
        );
      },
    );
  }


