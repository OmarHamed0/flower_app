import 'package:flower_app/core/styles/images/app_images.dart';
import 'package:flower_app/src/presentation/widgets/home/app_bar/search_textfeild.dart';
import 'package:flutter/material.dart';

import '../../../../../config/routes/page_route_name.dart';
import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/styles/fonts/app_fonts.dart';

class CustomAppbarHome extends StatelessWidget {
  const CustomAppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              AppImages.logo,
            ),
          ),
          const SizedBox(width: 16),
           Expanded(flex: 3, child:  GestureDetector(
            onTap:()=>Navigator.pushNamed(context,PageRouteName.search),
            child: Container(
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: AppColors.kWhite70,)
              ),
              child: TextButton.icon(onPressed: (){}, label: Text( "Search"
                ,style:AppFonts.font14Gray400Weight70,),icon:  const Icon(Icons.search,color:AppColors.kGray ,),),
            ),
          ),
              ),
        ],
      ),
    );
  }
}
