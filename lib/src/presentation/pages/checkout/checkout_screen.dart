import 'package:flower_app/common/common.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_states.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
   CheckoutScreen({super.key});

  final viewModel = getIt.get<CheckoutViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(_) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(AppLocalizations.of(context)!.changePassword)
        ),
        body: BlocBuilder<CheckoutViewModel, CheckOutStates>(
          builder: (context, state) {
            return Container();
          },
        ),
      ),
    );
  }
}
