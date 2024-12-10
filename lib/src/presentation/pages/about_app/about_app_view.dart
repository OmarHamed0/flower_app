import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.aboutUs),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 24),
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.aboutUsContent,
              style: AppTextStyles.font16WeightMedium,
            )
          ],
        ),
      ),
    );
  }
}
