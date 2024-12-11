import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/occasion/occasion_states.dart';
import 'package:flower_app/src/presentation/managers/occasion/occasions_view_model.dart';
import 'package:flower_app/src/presentation/managers/product/product_cubit.dart';
import 'package:flower_app/src/presentation/pages/occasion/occasion_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/api/core/error/error_handler.dart';
import '../../managers/occasion/occasions_actions.dart';


class OccasionScreen extends StatefulWidget {
  int? index;
  OccasionScreen({super.key,  this.index});

  @override
  State<OccasionScreen> createState() => _OccasionScreenState();
}

class _OccasionScreenState extends State<OccasionScreen> {
  final OccasionViewModel occasionViewModel = getIt.get<OccasionViewModel>();

  final ProductCubit productCubit = getIt.get<ProductCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OccasionViewModel>(
            create: (_){
              occasionViewModel.doAction(GetOccasionsAction());
              occasionViewModel.selectedIndex = widget.index??0;
              return occasionViewModel;
            }
        ),
        BlocProvider<ProductCubit>(create: (_) => productCubit),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),
              Text(AppLocalizations.of(context)!.occasion),
              Text(AppLocalizations.of(context)!.bloomWithOurExquisiteBestSellers, style: AppTextStyles.font13White70Weight500,),
            ],
          ),
        ),
        body: BlocBuilder<OccasionViewModel, OccasionsStates>(
          builder: (context, state) {
            return _handelCurrentScreenView(state);
          },
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
      final errorHandler=ErrorHandler.fromException(state.exception, AppLocalizations.of(context)!);
      return Center(child: Text(errorHandler.errorMassage));
    }
    return Container();
  }
}
