import 'package:flower_app/common/common.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/occasion/occasion_states.dart';
import 'package:flower_app/src/presentation/managers/occasion/occasions_view_model.dart';
import 'package:flower_app/src/presentation/managers/product/product_cubit.dart';
import 'package:flower_app/src/presentation/pages/occasion/occasion_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../managers/occasion/occasions_actions.dart';


class OccasionScreen extends StatelessWidget {
  OccasionScreen({super.key});

  final OccasionViewModel occasionViewModel = getIt.get<OccasionViewModel>();
  final ProductCubit productCubit = getIt.get<ProductCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OccasionViewModel>(
            create: (_){
              occasionViewModel.doAction(GetOccasionsAction());
              return occasionViewModel;
            }
        ),
        BlocProvider<ProductCubit>(create: (_) => productCubit),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(AppLocalizations.of(context)!.occasion),
          ),
          body: BlocBuilder<OccasionViewModel, OccasionsStates>(
            builder: (context, state) {
              return _handelCurrentScreenView(state);
            },
          ),
        ),
      ),
    );
  }

  Widget _handelCurrentScreenView(OccasionsStates state) {
    if (state is LoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is LoadedState) {
      return const OccasionBody();
    } else if (state is ChangeOccasionState) {
      return OccasionBody(occasionId: state.id);
    } else if (state is ErrorState) {
      return Center(child: Text(state.message));
    }
    return Container();
  }
}
