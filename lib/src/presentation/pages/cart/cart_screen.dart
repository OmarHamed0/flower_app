import 'package:flower_app/common/common.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/presentation/managers/cart/cart_action.dart';
import 'package:flower_app/src/presentation/managers/cart/cart_view_model.dart';
import 'package:flower_app/src/presentation/pages/cart/widget/cart_body_widget.dart';
import 'package:flower_app/src/presentation/pages/cart/widget/cart_handler_widget/cart_handler_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/styles/images/app_images.dart';
import '../../../data/api/core/constants/status_code.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    BlocProvider.of<CartViewModel>(context).doAction(GetLoggedUserCartAction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<CartViewModel>();
    return BlocBuilder<CartViewModel, CartState>(
      builder: (context, state) {
        return _handleBlocBuilderState(state);
      },
    );
  }

  Widget _handleBlocBuilderState(CartState state) {
    if (state is GetLoggedUserCartErrorState) {
      return _buildErrorState(state.errorHandler);
    } else if (state is RemoveSpecificCartErrorState) {
      return _buildLoadingState();
    } else if (state is GetLoggedUserCartLoadingState) {
      return _buildLoadingState();
    } else {
      return _buildSuccessState();
    }
  }

  Widget _buildSuccessState() {
    if (BlocProvider.of<CartViewModel>(context).cartProduct.isEmpty) {
      return CartHandlerWidget.buildCartEmpty(context);
    } else {
      return const CartBodyWidget();
    }
  }

  Widget _buildLoadingState() {
    return Scaffold(
      body: Center(child: Lottie.asset(AppImages.loading, height: 300.h)),
    );
  }

  Widget _buildErrorState(ErrorHandler errorHandler) {
    if (errorHandler.code == StatusCode.forbidden) {
      return CartHandlerWidget.buildUnauthorizedWidget(context);
    } else if (errorHandler.code == StatusCode.notFount) {
      return CartHandlerWidget.buildCartEmpty(context);
    } else {
      return CartHandlerWidget.buildErrorWidget(
        errorHandler.errorMassage,
        onPressed: () {
          context.read<CartViewModel>().doAction(GetLoggedUserCartAction());
        },
      );
    }
  }
}
