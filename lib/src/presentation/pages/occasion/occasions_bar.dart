import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/fonts/app_font_weight.dart';
import 'package:flower_app/src/presentation/managers/occasion/occasion_states.dart';
import 'package:flower_app/src/presentation/managers/occasion/occasions_actions.dart';
import 'package:flower_app/src/presentation/managers/occasion/occasions_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OccasionsBar extends StatefulWidget {
  final List<String?> occasions;
  const OccasionsBar({super.key, required this.occasions});

  @override
  State<OccasionsBar> createState() => _OccasionsBarState();
}

class _OccasionsBarState extends State<OccasionsBar> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<OccasionViewModel>();

    return SizedBox(
      height: 50,
      child: BlocBuilder<OccasionViewModel, OccasionsStates>(
        builder: (context, state) {
          int selectedIndex = viewModel.selectedIndex;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            viewModel.scrollToIndex(selectedIndex);
          });
          return ListView.builder(
            controller: viewModel.scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.occasions.length,
            itemBuilder: (context, index) {
              bool isSelected = selectedIndex == index;
              return _buildCategoryItem(index, isSelected, viewModel);
            },
          );
        },
      ),
    );
  }

  Widget _buildCategoryItem(int index, bool isSelected, OccasionViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        if (viewModel.selectedIndex != index) {
          viewModel.doAction(ChangeOccasionAction( index: index));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.occasions[index] ?? "",
              style: TextStyle(
                color: isSelected ? AppColors.kBaseColor : AppColors.kWhite70,
                fontWeight: isSelected ? AppFontWeights.bold : AppFontWeights.normal,
                fontSize: 16,
              ),
            ),
            if (isSelected)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 20,
                color:AppColors.kBaseColor,
              ),
          ],
        ),
      ),
    );
  }
}
