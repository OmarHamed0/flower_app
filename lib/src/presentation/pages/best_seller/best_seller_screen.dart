import 'package:flower_app/core/styles/fonts/app_fonts.dart';
import 'package:flower_app/core/styles/spaceing.dart';
import 'package:flower_app/flower_app.dart';
import 'package:flower_app/src/presentation/pages/product/view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class BestSellerScreen extends StatelessWidget {
  const BestSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(local!.bestSeller, style: AppFonts.font20Black500Weight,),
        leading: IconButton(
          onPressed: () => _navigateToBack(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Text(
              local.bloomWithOurExquisiteBestSellers,
              style: AppFonts.font13GrayWeight500,
            ),
          ),
          verticalSpace(8),
          const Expanded(
            child: ProductView(
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToBack() {
    if (navKey.currentState!.canPop()) {
      navKey.currentState!.pop();
    }
  }
}
