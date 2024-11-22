import 'package:bloc/bloc.dart';
import 'package:flower_app/src/presentation/managers/product_details/product_details_actions.dart';
import 'package:flower_app/src/presentation/managers/product_details/product_details_states.dart';
import 'package:injectable/injectable.dart';


@injectable
class ProductDetailsViewModel extends Cubit<ProductDetailsStates>{
  ProductDetailsViewModel(): super(InitialState());

  void doAction(ProductDetailsActions action){

  }
}