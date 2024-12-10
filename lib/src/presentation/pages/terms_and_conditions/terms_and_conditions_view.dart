import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.termsAndConditions),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 24),
            child: Column(
              children: [
                Text(AppLocalizations.of(context)!.termsAndConditionsContent,
                  style: AppTextStyles.font16WeightMedium,
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
