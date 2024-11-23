import 'package:carousel_slider/carousel_slider.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/src/presentation/managers/product_details/product_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesSlider extends StatefulWidget {
  const ImagesSlider({super.key});

  @override
  _ImagesSliderState createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ProductDetailsViewModel>();
    List<String> allImages = [];

    if (viewModel.productEntity != null) {
      if (viewModel.productEntity!.imageCover != null) {
        allImages.add(viewModel.productEntity!.imageCover!);
      }
      if (viewModel.productEntity!.images != null) {
        allImages.addAll(viewModel.productEntity!.images!);
      }
    }

    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 400.h,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 7),
            aspectRatio: 16 / 9,
            viewportFraction: 1.1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index; // Update current index
              });
            },
          ),
          items: allImages.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: 1000.w,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 20.h),
        Positioned(
          top: 370.h,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: allImages.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => {},
                child: Container(
                  width: 8.0.w,
                  height: 8.0.h,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key
                        ? AppColors.kBaseColor
                        : AppColors.kGray,
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
