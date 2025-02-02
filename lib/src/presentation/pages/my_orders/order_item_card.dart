import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/core/widgets/cached_network_image%20_widget.dart';
import 'package:flower_app/src/domain/entities/orders_entity.dart';
import 'package:flower_app/src/presentation/managers/my_orders/my_orders_states.dart';
import 'package:flower_app/src/presentation/managers/my_orders/my_orders_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/common.dart';
import '../../../../core/styles/colors/app_colors.dart';

class OrderItemCard extends StatelessWidget {
 final OrdersItems item;
 final String buttonText;
 final int index;
  const OrderItemCard({super.key, required this.item,required this.buttonText,required this.index});

  @override
  Widget build(BuildContext context) {
    final product = context.read<MyOrdersViewModel>().list[index];
    return BlocBuilder<MyOrdersViewModel,MyOrdersStates>(
      builder: (context,state){
        if(state is LoadedMyOrdersState){
          return Container(
            padding: const EdgeInsets.only(top: 8,bottom: 8),
            margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            width: context.width,
            height: 130.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.kWhite70, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CachedNetworkImageWidget(
                  width: 100.w,
                  height: 100.h, imageUrl: product.imageCover!,
                ),
                horizontalSpace(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.toString(),
                      style: AppTextStyles.font12WeightNormal,
                    ),
                    verticalSpace(4),
                    Text(
                      item.price.toString(),
                      style: AppTextStyles.font16BlackBase400Weight,
                    ),
                    verticalSpace(4),
                    Text(
                      item.id.toString(),
                      style: AppTextStyles.font12WeightNormal,
                    ),
                    verticalSpace(4),
                    SizedBox(
                      width: context.width * 0.45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.kBaseColor),
                        onPressed: () {},
                        child: Text(
                          buttonText,
                          style: AppTextStyles.font13WeightNormal
                              .copyWith(color: AppColors.kWhiteBase),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
